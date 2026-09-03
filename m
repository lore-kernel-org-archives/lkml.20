Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9524A5C5C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441743; cv=none; b=MUuE0O+oFvwgYc/hBEVS5Zycr5bnli5sm3CUBQI1MzFrU1VtWC1geIlMbOd1zFYxY+2olmVBvHoA5c9PvkQsawYgVrOGryB1NQ+X0N3pgtYI9IzDE7j60j37JJ7l+6ZL004Sjx2qugwZ+QynnNCjzyzgUUsTnJEyhJLZDMGJF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441743; c=relaxed/simple;
	bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b20+B/DwG5JgaCUFxp9Y+ApIy2TMFQAKlnU2WIrnihmuIcyA6ke3bA+xGFiXppzsvh0y6a+tcn7Erx0XD286Y/aKukoBV7nxrnqPFS/PINlPMEOCCsEViUzmsPJMU4QviUTfGJHvy+F4rl0VoUVBZhlb3N0As5FwGenbshvgzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqZFWulg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqZFWulg"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71a50caa9so32859235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441733; x=1789046533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=SqZFWulg7KvcXlqEnA4Lw6rZd480mwzZMQ5bt05xAUmms0+5HvMJwskTIzh377Em2R
         2cdJgjV/FAUdd0FhH3G7v4uJcWoo3R8fJjPKrJ6U121eVEBGDyhkkK/bwG5B6DdO3yXx
         mCuX59Nb+IW0esKBCg1ccJ/Kq4B6YLt5dpbxahhWG876Q/biKids7bDiP39jU0xzz5L5
         q35LThB18mcFz1TcyQTjq0TQOZHTRZDgqkKxJDnSlbJmC/naWFxpBGLzv/fWr7WW+LFk
         BWZ/omuQQ/Vmypxl4mkYfLb5Swg0VGDFEAz7PSFsRbpPp6S24JD0seJBrsvl9iDqy/mf
         ++jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441733; x=1789046533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=r3Qnfope1edEnvwuxkRxgrOyX4gXWfEGehzUvTVyL1pfa+QRVPPsJMzqpQ0Ru4r7gE
         thEk4iOzRh+XXdg3cFoK517LgZIOz4zpZWyQi4AuaDHBhJ3gV/0++7wz1PQjq0JXL8bq
         HK8CYWLg9rZl++qrE9jRhjh4Raj/1fzpkjhst+MA8ewjVpxCQmtdFTPFuHXwAP+Dlx+e
         +R85FwElrrk1XOyJLJNcZ0QyW5zkFC7uYAWw60SkYIv9rFKSIdtN4iRofqZaVRpPd8QV
         Y4BzADASggbBLT6zSvo6+mD7XfHt2Wyfc1axBYa/lAv8rdZnWulHnF4XGbR9VdbGZ+sH
         kw1g==
X-Forwarded-Encrypted: i=1; AKwUvBzLTQa6ZWEqW+kKo1ghE5h6IFI6XuETzS0PZQMs+gDyaYEaf44oxpKO4vtvXkvg9J7t6bB0NCBcudCcuAI=@vger.kernel.org
X-Gm-Message-State: AFuF++mzHMG1IT5/obNW0sIESVM5BRREe6mEwdnUZIrlHFCoMQTrVxKm
	vIH9i1hAIKAPIO+y/T0HeR3CwfDOMx8wsK0IbyIO7MAEtCTwlJUfbJoE
X-Gm-Gg: AYBFou3a59z8JRtG1l05Q4ICl0+pYJkZ18+2o/YkUaf6GFgu1JGl9X3NVlYwjw9R2Qo
	BCtQyw4IMtg31RckcRfkRhIXhHEiw9bDQKolrKoTo+W7+6qPuwY80A4oOuYovfsnZdGhjhMll08
	TfETRlHgk6lbgio5z6Ta1E16+xwERNepBDQyzAcbj24D66U3NsrT7ijXmnvFpR2EfaxeLG+eI8O
	qkFN9NKc+F7vjaNoSHHBkagin1hcg3XLU2ZnY4WZnTBPRMkTiU0dEdrm7r7bmjgivQFBxEEjGnJ
	XabQ71+T0i6I4kZEVsStyZE/ac1JEjmg2KbtZa0udv6EXHAOFX5l0POhzRDcmzyTY6I+8puoSjr
	MuolEq8lMPFReWYw9+3PH+fAlEMd45b9MSKet+2HCFqCWWlFGBbJzfmmw8iD0HFqozu1VlDq+Hb
	QoZsbGTpasqRaEA/d4RiuXquyVKqANR+VHFviv1UIMaD5KC8UnSy0RSQU7pCqjRqSTKBC/0gsd3
	o4=
X-Received: by 2002:a17:90b:2808:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39aee1c63b1mr20007782a91.18.1788441732646;
        Thu, 03 Sep 2026 06:22:12 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm5407729a91.0.2026.09.03.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:22:11 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 2/3] trace: integrate stackmap into ftrace stack recording path
Date: Thu,  3 Sep 2026 21:21:50 +0800
Message-Id: <20260903132150.253372-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065433.2D6361F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-3-lipengfei28@xiaomi.com> <20260902065433.2D6361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:54:32 +0000 sashiko-bot@kernel.org wrote:
> Could the commit message be updated to reflect that the buffers are not
> cleared?

> Does this code unnecessarily export tracing_reset_all_cpus() outside of
> trace.c?

Both are real. Fixed in v6.

The commit message was left over from the stricter reset design that
was dropped in favour of map-only reset. It no longer claims the
trace_array buffers are cleared. ftrace_stackmap_create() still takes
the owning trace_array, but for a different reason: the text and
binary exports run stack addresses through trace_adjust_address().

The export was indeed dead. With the ring-buffer clear gone,
tracing_reset_all_cpus() has no caller outside trace.c, so v6 restores
it to a private static helper and removes the declaration from
trace.h.

Pengfei
