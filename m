Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865166;
	b=Gbeg8Cr8Jqwa5cuVMqCAer5BAwVR3kkgR+4c10HDhtESTqc3Z6Wm3R1Dd1Jc2RdknvVK
	 5gZJOoHeXOiEBsAk2QezxPTGUgy2R30H+axI6TYpMBTNPAFXggrIVc9sBGepbQ18d1XWo
	 pLaEL43I7MpDb1wcZjZ2rz08Lkh3WMi14dKN1XM5/kH1OwIVejFXchHELb995LjwOdDf5
	 ws6VtsQCxDsDgP6pmf7jdWXuXsD1IsFzhSzhIuIDNZoo3X4smfZjTnpnNjSqDJO+FHasX
	 HexMYPfqMUadNV/6JpIVl1Dh45qJU4tn1Y1ec+xAAONOg39zQo5wrppL9VIVIiB7YDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
	b=vHHAmvtcOfTL/es1OpwHbqHwExr9qe0vQgA5gwIPB5EvOfE2zLCMzQOmdoJKfA/hR8+S
	 bgYrzA9cjtfW8aFX0CAqfub7/s/yIkfhYcsUnz7Dzbv3IU5zbWaVVXm0QKLPG7iCKCNAL
	 ghKHwuUV+ib7FHM7ll1eNMUQ1R8r+1vI5Px5WPtv2PInlGDgA7vZYNcyaFBvv/gLJU62X
	 EQSIyPxvlrFoGxumVIQOAmOcrdG+pCjhoyca7sFPDs4/tyWTF0YBihH2ed8Ym21LGFUia
	 m4fRjHlU6gJjisuavaWd3UK7pBwlLYl3gUNobOJuliBPXKeBhWw3ApozOqvXh5DctqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTYTL5WW;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE683606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE683606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTYTL5WW
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso717450f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865164; x=1794469964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
        b=gTYTL5WWYDxqb80o00A+Io7d6oUAzHxd1+A00C6XY8mnit39plO17qP/RrflebpSln
         xJoeT+4Zt/3aYy4vtNl0ptOE+QqUmgvSWjpIO/9+HLryekbeBoIMr0/2xO3hJ7bTmBUp
         CdwapW/909bXq2FYfecX0cA8VHiF8ftUMcevWmqTYhBeMbUF7dbTzLYSPWCiZDKsnnst
         BNNSkIP7AD60RWz5gX9wpnXEdyWMvauoP+tmX7t77tC7DXFtTKv1SAaIiGAtfOI57vlp
         zTU9AiTm/MYGeAzGX08iXfeeU3IMqnUjiqZut/T70pnzggmVlDyS9xAdwAISeNMlfoEd
         22fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865164; x=1794469964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
        b=Aiet8Z1nasOsC0RBXf0azxz0eDlS+z9rlGxUu9v+qMOowVDS1snWBY2bhBIqiFjTRG
         m4cB2rHS/y/v5fMVfHCxjKiaW2tG6UMbD5TJZYZnXpL8+IFmprco1PqHJRhRY5KiAKBg
         ketaUH8OWNXJeNu3Ed85fQdZ/sosPRFMoa7XHfus0XVA9r063zUuknqaheDTkDY0A7RM
         4Qdvx5CIbd3A98MK5/3ESU6KfuamoEgrMfxKHKU/INwCOLVVmrFgFk6tD5nMWrLSbvrH
         +pbdeY2RBg025nO9pLW+OQMdUNCaFVymS+C4L06e2CmHD89SC0KyBg4sEbQmzekfZ5D/
         NmXA==
X-Forwarded-Encrypted: i=1; AKwUvBzaB37OMnJv72dv7Cu5++TGrRyYcg9F4VyVktdMwstyeFDs5o8Gf9Ll0a+TkYCsg/cR9dN6W9Ft3x107Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ccUes9FlpGmi1i+gMKGGQFEJccZtgSnfzW3aa7yG+rXtQBnmu
	tCSSw6cbhnqKUiqiXgCGNId88RjuXGhCP1KMLbziWf3HHUeJOzejO+7j
X-Gm-Gg: AYBFou0zTaPKV5zEsdwkyWbxSFZL4+X8Zra3xeCpS12nMlpLBsaft1qgJn9WVMzJTLG
	/vpyMUbQahwSS8D8VBRmZtq2IfqMlYo2QfcnaTFXRyIFE5bYyVVrjDekKM6BV+vrUUCYHS16YVL
	fGIygBj29ZfG+E9iEWqKoS7Mh8Yaa4uKlpFMVWlS4gbjSxT6Cit7PdyytTsUClzSb7O4gEeP5+V
	L3g8t7vW3cNxLcJm5VYJdLGqWyV/dySfhMNlRD77cxUK5+K+CmjSr1gCR5ElnGNK6ATFDbsKPCj
	J6k81ipYlQIWgs+yPPv+6AiOgdsVqOBpfJIk/aYPaTuDL5yme2ZJLPmepMgxsVjlNpqwuYfDIDk
	C3VCLEYya7oJE6D4Xjg8En1aw/Gls83Ya15v8vD+Vv2ACZEgar1VhH8ZTgZFfuey/bLSb42bx15
	qxJmbJ7ZvPK1Fd882g1IJvY8g+CIVUBUd/QLWhAw2oHE5Mu8W8AHAmiPHVTg0V7cXQYsISp9YpE
	2DeA6GmmvY9c7XimRxwSjwisCrRpy3LdVbMQiN0vsbk/Oi/lAo7Xc3Z+L9verY1+OUzn6wASeAW
	Z8ZKFmcbh2Oy311gYup3XyFLP9gmBvReuKwvkY18b6lPpnnMDYIqtxUjutXy
X-Received: by 2002:a05:6000:188b:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-48e6e2ba5dfmr41503809f8f.6.1793865164140;
        Wed, 04 Nov 2026 23:52:44 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm8958338f8f.51.2026.11.04.23.52.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 23:52:43 -0800 (PST)
Date: Thu, 5 Nov 2026 08:52:38 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>, Cheng Wen
 <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <20261105085238.337cb70c.michal.pecio@gmail.com>
In-Reply-To: <d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
	<20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
	<b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
	<20261104175949.71804650.michal.pecio@gmail.com>
	<d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 23:54:39 -0500, Alan Stern wrote:
> > What I find more disturbing is the existing protection from this
> > race added by 88716a93766b - it looks like core was triggering this
> > too.  
> 
> I don't know anything about it.  That commit only touches xhci-hub.c, 
> not usbcore.

Well, it looked like core was calling hcd->bus_suspend() before
disconnection has completed.

But I just found that xhci-hcd had a bug where hcd->free_dev() would
return before disconnection has fully completed, which can obviously
trick core into doing the above. Now fixed by 7faac1953ed1.

> There should never be any outstanding URBs on suspended ports.  If
> you have any examples, they need to be fixed.

There was a report of some HID driver leaving a pending URB on ep0.
Core blocks and flushes other endpoints, but ep0 is still needed by
device driver's suspend() call IIRC, so it only gets flushed after
the port is put in suspend. I wrote a patch which reliably triggers
ep0 unlink on a suspended port in this manner.

Reporter's HC wasn't expecting this and failed to perform the unlink.

> The core relies on drivers to unlink outstanding URBs and not submit
> any new ones after they have been told that their devices are going
> into suspend.

That's a little weak. The reporter got an LLM to patch the offending
driver, the LLM claimed that other similar drivers have similar bugs,
business as usual. IDK if they have been fixed.

Also, core ignores suspend() routines returning errors during system
sleep transitions. I'm not sure if drivers are *allowed* to return
-EBUSY in those cases, like they do to prevent autosuspend, but it's
at least another opportunity for bugs in drivers to cause issues.

> I suppose we could check that there are no errant URBs still in
> progress just before putting the port into suspend, but is this
> really necessary?

It's already being done, looks like those drivers aren't *actually*
trusted very much. But there is the ep0 loophole.

Regards,
Michal
