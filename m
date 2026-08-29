Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5688199E89
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965471; cv=none; b=uAKA5nRfEwVl1pWHWKclqTJVpUKNT6TPAgtq5CGEHlGRKNbuwL4D1oJg/HuGSwuaaOyHCMYKeDqbO+xfGsNLY2AJFQHmax6RJ1YPvY4QX+Z/UQ+9Dtl8GMCj4XX9JxVvUvc+tA9TIqGUPv/C8s/ZJ8Gp4abVtZj2Z0UQTlo5ytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965471; c=relaxed/simple;
	bh=8YWpV4BxrKzVyIl/iwj/YMPjck27je3e2lc5dcgDYFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoX+HkgKQjoTVbpScOWnXSPR5mj8hDH4Gt2Da6On70p+FtV8D/ZSaXCG10gd6JgZ9Pp4J6FrdnVgM0nt4G6T5I+iwQQ2T4Llkcjs7Z66DKnsr4/kmf7XSjJTZhV/m+FIAtL86M+fEhqKNA+OHIgofnA60n859D2ebBa417Q/1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6I+F1f4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6I+F1f4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso1449559a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787965470; x=1788570270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whJWdgZLbjtRSnzZmPCdoj842hOmWmmPzuhg02zkVIw=;
        b=X6I+F1f4Y1yuquyP9TKTplvq14zi0U7Xcf/4iFkEw05pOLcGh64YQCKIKxBBmHVUA0
         pUjMhPGmlLkzqdr/aGrNT4OpvXCxK6RQLRmaiz/BOBPjdr9dEUUIVEN9ZAcU/rZ4UNep
         eroO57JaIaFo6l30iYkIg4iIvU+ti9J4kYIRHGUibMT898OzYHUeLfYs+NCb+08jXhzK
         M02joZsnhI9zfniE5mOQWfwdpogxo+rAGZ2pAlFA+gp9qIJGC4qRT5qgjho3v76xxDkQ
         pUk4ywZCB8IUE3k/RsV7pIS7G3NVOn+xJoeuheLyYpGa407Xk5jfEUYTzvyaERMY4sKl
         uxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965470; x=1788570270;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whJWdgZLbjtRSnzZmPCdoj842hOmWmmPzuhg02zkVIw=;
        b=WB+ejFLhHe7m3GHxLsiGRcW4MnTiS4tGnqw/6YcaUMbKAvsCOsQ8Mvb8w46O01vhzz
         auv6Ygx7QVSVWs2xcq1p6TK/JxbMPPbFrP0va9ZZjMLzEmBqqF5mf6FPkVfFk1go22Vs
         ioMPgB+Y1NH00pSVgB4PSlc8DEvI1/HRSB8xMgtxb1IudehuH/o1J7cJK6M5moU1qaph
         Uyz9jqZzHJ4ubTtNjkvuqtogDJFZcD996ZRqvg3C0LOlQA9nTxesohO2VgN2aD1StfbZ
         DZSGtVGMbZBgE2tuUwFF6sCHTfcpM1wHKzeHpSLZU3etEf+FjA2z9ZJrO7gjpd6JSQol
         5nZg==
X-Forwarded-Encrypted: i=1; AKwUvBy/cEPHeC+4eR8eCDH3TNkI79TJLzBlCAyeWY8TrY3TlTLDLyU63zPpHhHThN+8yOMQBW9isHJD3JRl4bE=@vger.kernel.org
X-Gm-Message-State: AFuF++mjOq7k/g+0ih2c2PpZmZeuC/YtDeht1XNd/19jLOlrJtoqFouq
	H7tRchuwdRkRNUDW8+KKOyhakxlgm6cM7e4kdKQOywWvQU2ZjxQhHWk/M8gHVMGu
X-Gm-Gg: AYBFou3DL51/as5L6yYLiAffC0b1jen2YOQN3nR9FVno8qAQ9ehAnZk1+u76RUQWcFZ
	YKRk9gpGzMwmExqc7stbM5O/tc55EddZnxBiy1MjvOitLq4S5CjzUoOpr9qr3SQodyJBB9Lyb5g
	rMVHZSOzUS6s1Nkw0YQ9q+jDHuen3Suark7wyWFeeSLkChChS10LtSbCj6zyC5R2nfT3ibtVlYP
	mGusg18EVEsZsEd10DbwYVffUQ2bgHwqg0JxzujGI8Ydw7RFddTr4kdwtTsBf+vGeE4uPKY1Ixl
	jP+0Qge5ttFWNkW2ARALah2An5pYVUvfYxl3/fg0w1VN/X7QqkQpLOXlGhKSbMJgVYsBTBMqPT0
	GAHTVzRzmIFxBAqIG+RnDSeFFd8lpSBKoSM09QBZzmwXEXDS7JUohezlXBRMik+U3mhdFLdAuI5
	Uo+pP1zqi3NRfaTI260Me2+Yaer0EvczXpVxjRJ6L6txuWqyaU2VL1lRkXl013xyeYp/i8tGn+o
	DY80h7/AGwj+e425Q8mw2orQ3Lsp9upXFREMhZV40IBiaxkKC2Fgq1Fy/bRO+qtu+JhPQc+suqy
	8W5ikonqJMw2wWuBAihjdfe7
X-Received: by 2002:a17:90b:3ec7:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-396d1041324mr16954197a91.16.1787965469892;
        Fri, 28 Aug 2026 18:04:29 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186803asm9247989a91.11.2026.08.28.18.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:04:29 -0700 (PDT)
From: Wei Jie Law <98lawweijie@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
Date: Sat, 29 Aug 2026 09:04:09 +0800
Message-ID: <20260829010411.7874-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANRwn3TWTHxP=ZEpgZzjRweC8vqifoi2koKgSQTEuPuY4FZxcQ@mail.gmail.com>
References: <20260825103104.12090-1-98lawweijie@gmail.com> <CANRwn3TWTHxP=ZEpgZzjRweC8vqifoi2koKgSQTEuPuY4FZxcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Aug 27, 2026 at 12:02 PM Jason Gerecke <killertofu@gmail.com> wrote:
> I would appreciate an update to this patch with less confusing wording.

Reworded in v3:
https://lore.kernel.org/all/20260828033323.82958-1-98lawweijie@gmail.com/

> I don't believe there is any situation where maxusage could be less
> than report_count since it is initialized as max(usage_index,
> report_count).

You are right. Thanks for the correction.

> We would also *want* to read fields beyond the last-declared usage

Agreed; the submitted v3 keeps that, and the changelog 
notes the 6.2.2.8 reuse rule.

> Given the above, I propose simply making the loop condition " j <
> field->report_count". Thoughts?

That is v3, with Suggested-by: you.  Retested on v6.12.105 with a
kprobe on hid_field_extract(): with your condition the 12288-usage /
Report Count 1 descriptor extracts nothing in the driver loop (the one
remaining call is the core's own in-bounds fetch) and trips no KASAN;
stock extracts at bit offset 98296 and does.

As a side note, I am also looking into a separate but related read in 
the same function based on Sashiko's review. I do not want to hold 
up this patch over it or speculate before I have it pinned down. 
If it turns out to be a real bug I will send it as its own patch.

Also my bad, I realised I had not replied to this thread addressing 
some things you have said, after submitting the v3 patch.

Wei Jie
