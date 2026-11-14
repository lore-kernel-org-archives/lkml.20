Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660657;
	b=k/kdsVWCvC0wkk/HIgL6H6B10/tIOHcsGjTkszBCKeMgvrPPJSmd1l9L2hel/+XjlvMF
	 I6UHFIouOoQzjTnDaU/Z6lvUXGePhY0VxwTkV0nm8u3PxXrpnjKXTSxy3O4yACOTjdxqm
	 36OJZ4YlY6883Vou71gS36kqIBK+XgFvxK4RBaoOwry4cMj/vBhJ7DQqS+pqQ6PqPOcyW
	 8+/PT2N0qrXy8fH6liFROKctcDxcbD5wSp/tuI1Cc9r3Hvq+UOoIBXqXC7sxGsL/YcHyN
	 eYv2TkVzQIltTV5ckJVlBgI8xaVIPqgmbS/j26ZHpwmo8AGYGl7FtCVsYeoO7mBv67A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kq4h8stbmRwpSHkkjko79M5iC1GcJ39BIlnO54OGxk=;
	b=lyaK85b+9/jgBmr38x8bj5yXcOJJqv+2bcQ6l3hjWYB4kG0RHGH8R3pqcVRLprT7jN9h
	 EWutSuizKxPTEGmiyulviMFZSQalh86xwNZ/w/vFfxdbsjqJfJpY/xBSv4wG9QBn8UANQ
	 TDLbX9oCHmHQc/nF2f1Nb12vNSVDZEfE+T1Dw54cJ+CJi2x0s0LrRo56WUmzN07Ze5KXO
	 89cn9NadxmMIZsetWyP7i1Wt0hKW388kCKfFdWJc5xAFF68CFU7DLM2uO0DhVwjfxsMHQ
	 IVu96xrUCF7NGp/0p/uN1M3yU+/HT3+wpwqoxj0VnKGiHGkaSN+QspJ8W4jm20JP5lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=fLmbAXN9;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687A606A881
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6687A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=fLmbAXN9
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91f2b826fe9so21177716d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794660656; x=1795265456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kq4h8stbmRwpSHkkjko79M5iC1GcJ39BIlnO54OGxk=;
        b=fLmbAXN9Iqc0pev45nnyURfiaA+qA3Nhv5XHVN6XKwwH5o58M77MBRgCGRM3yj1WvD
         ieMQnqFCxluHSTdhv/WRaqSI72EjJuhgmqDYa6RnD+T9yebaSrS/578evDIxUfk3hsZc
         NKCwWfuYP4UnmcxbRxPGeYEE9B7quhJoDRv2cRRmrnpCCMVyDAk2rpzvUYuO0jbCykiV
         jeez7BhubtWySp/YT+hiAkvuRJIRBXXI3HnQuOPAePCDEEY+7MhdI0mgTtMRyUcCkFaV
         vzWLcdIBp0x1VHPSRs/bHgBsLTnEi1h4tOIUrUmRBdF8hgHoRY/th183N/nQDmhfm3AU
         REIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660656; x=1795265456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kq4h8stbmRwpSHkkjko79M5iC1GcJ39BIlnO54OGxk=;
        b=22GdciD2rS/nkBpkSMMUSrroo1iHjIXjynvWNTKjaNlpekSHlBxGFPfs3kWt3/PBwf
         KP6cP+ZRe3tJWcM6ktWt1IyBqyGTN6eSXfvSkINEQmIFAZeJrw3pBAACF1xvQarHiQvl
         b/Ccy1NT/qQotu4rj74vIM++4SyaSfx24AgaO2wIldJsDsPh1EPSxe1Qg4+kvNC8fUfO
         WLAsD44625sIPogAoHSODr8p3geY1XpO6wspMNJVKDQ0Tz/IOkCvn7aE7nOhG8CXuasK
         JzMotcgg3DEZZj6+qfd2V7o2AMHGmfd2UM4HZ41S2OO5fv8JxntNcvVzc+oUnn0s+nil
         d4bg==
X-Forwarded-Encrypted: i=1; AL+hErFZM+9R88IA9X1sOeKGI9NRewqvrxv65lfzq6/4BNKPK67K3aG7SMx6qKFuGgPnj4eeFWQRaVDPrdjtokA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Erl8vHqBEqtyAOeyNzkhSrkSojZMjftzHV6lvPyDeOJgYzrV
	w3W3H12Yab4LfhiTGM80WqKoGXBTYUNy2tw0KE6F8NnKWwLSBeTbikSVrENtGkKzRw==
X-Gm-Gg: AYBFou2OkWNWiSsVU6pbsgMkVSJyz/y+OzGZuZJEDWF1sfYSPP8Czhx4nxH9SSzvkya
	c4FgfNR04stwmgVAolI0RHFEVaCZ2ckgBJUx+21EPvi9KMM/xj7+p7eAdR3oLxkdApS+3MOXiPQ
	Q1wvwEwYQXPF/7PDtXT9iSL2pB7Osku72N69OHaPmopznrgDXyvyuk0ehT7ZHvhTkzfHfbRjs1p
	nbo6jKHQ07HlbalTiVqxvIbt0W6TFZICj+8inbVqwVhXogt8CTwFIcseVQQyNii0a/D+5yW0gba
	JHruUji88TZB/BZD3tyNA9qdXJ3InFsOIzc2rUiiUya6lAYPXc0mcFPthIynAzTGdddK5iwDUJp
	qMUN9M2/m79YSgXR7TM1MAHtESMEbTcMiL3xJJsL5HS3/hzuq7aiHX82pUGqhKAleErslhYvntF
	n/V8Sya1F/JQrpsg0KwwtzcVCXCPp9chi1gO+hFrKnLcHZx9tJ9pqkd/RWjNpnxKGAL5FGZz+iV
	XJ3gsnKKBFaDQQKGTQbAuZ3DvJuiBv1RlmSDK4+Vhjn4sBbQO2pus3g+uaOL5Zfn99gS6AscqE+
	L2Q4QI14Bvx7rfv0vKucA1MNWYIHzTTKwriTMh2gZYJoRNu+/7t3
X-Received: by 2002:a05:6214:4b10:b0:91e:f04a:b237 with SMTP id 6a1803df08f44-91f242135efmr89847176d6.39.1794660656394;
        Sat, 14 Nov 2026 04:50:56 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm42338146d6.44.2026.11.14.04.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:50:56 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] hfs: do not end readdir at i_size after an unlink
Date: Sat, 14 Nov 2026 07:50:53 -0500
Message-ID: <20261114125053.466665-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bf79e0f0ba166bef46dc5d196b0877dabe252248.camel@dubeyko.com>
References: <bf79e0f0ba166bef46dc5d196b0877dabe252248.camel@dubeyko.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2026-11-12 at 12:45 -0800, Viacheslav Dubeyko wrote:
> Currently, I don't understand how the issue happens. Could you please
> explain the issue at first?

It is the same issue as in HFS+. I have explained it with a small
example in my reply to patch 2/2.

Thanks,
Hengyu
