Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331208;
	b=tdkyEE6QwrvgEfnGjnbe0/fAtGGF/l7VHwtBF3DMWeMEY+z7ePaxFvzCsIRy2jp7Iawb
	 CuLvZlF2lDAbh9YlJxQpR7HYdCk0D7vkY1FVZQfA/N5r6XxXLvVCl2UWmQ1QbFZ0MfjxK
	 z+/019gPReLFHgvCsgJPUlbyPsrUcpHiLsLS5lPNGwbZnel1NV0mxrPgB50nlsTTHH1JQ
	 ZkB03S147tvxTnRpFIhyC3AvBDul7TUM8BhJOG6IPg4RxkVmUtuEsC5vj5/5j9pJpLzMi
	 fAA8akwsDpelvfx1pupDlO1eDYbZ40t6KOdxKsnaLrkNCMBo6STHxnOD9j7OKBn/QXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6rss23bXzihYLvh5XkbaLwnETqaIZS+Fw5w7OvzrICE=;
	b=y0bRqA+qv/02FAed45jdpK+ygDOE4vA3nppOjcpC42B0EngQ2UYLJBSunf6TRqe9vGEF
	 Vitdn0i4PaUl4eQKzT8C+lGee+boIO5KPokQOid8fxEMqMJJH7Ld45zI5CtFbnMA6vDSL
	 Acq7nNiz4E9blxAakrrj03LA560BCqLW+tgw7y54EEIJFKmW93Gxs2kJaZy2fr98bJ6tv
	 GH2Em6h60WWwhLX4+jzr75ppv5xwHZpFU+E6hy0LKvadaaa0Pw4cME5XSkBIFdKUf6aHS
	 LmooXpE7WY5pqyF77bEa6eTWASt4Oc34E77rH/9nVY6spjWqTTRymiG7yfKy7JrtXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQkj2yaq;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B408606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B408606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQkj2yaq
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so78618b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331207; x=1793936007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rss23bXzihYLvh5XkbaLwnETqaIZS+Fw5w7OvzrICE=;
        b=iQkj2yaqagmPOtWMHT45u4esFyGIUD7mtvdDsjB7v2RP15ecu6KRKGVGrwF/zlOAVR
         pKvg2RWxdTOAfSpVDvgNrWZfI0pIzR6lfZbpAd+vTzp9sJ4xCUjf3Oxps4poHBIms4l6
         OeZJvlsIhckLi/XCSoQ1XO2LThlzLRGh/kg/O71hHPS9F5htFVTvNb6l9Hf2eDgLlhhw
         jQM0WzxZet1na56DYjAqupJYnDUQVgzwJAz/zxt+XdKdW6+1+qxmx/SNnze/sPTUnIXA
         hSItjX8j4R6gzuuufTb/x1d3eSmm5r6t/pPv3jI0pKLghpfP6jbuSxIHdS7vMdzojcu+
         XL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331207; x=1793936007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rss23bXzihYLvh5XkbaLwnETqaIZS+Fw5w7OvzrICE=;
        b=lu2WT2QcaT3SbQ6zcUdGEw81VjIakL2Hj5gX65q+bfdglroAZSX6FtTKlbvp4Xs+PN
         h26ir9uLe3jtibo5os30ONtzI1E4PHzifAoHKdNDnbMvLbJ//nntdoO1zsJjMmlMf0pG
         y8jHVbOz101VDbpbXoVY9lbdkb0/eV6CGIuFO8tBbX8dxF0DT37xg/DO8kNoqj3G+BAW
         E/YFZeW5QG+xClBnKOvfQ5yJOthcRcGgKzicIu7VdnEaSCZGHhMOX4sSO0Dy0XRGJjaB
         XZc7wIOOqeU9Vu+O4GgI1uuzESF05AanDwl4mgJSi310uqE3GrIcybwR9tvzt9m4O0cG
         aIVw==
X-Forwarded-Encrypted: i=1; AKwUvBz/APhBhXD8Grjjtw0PpqnYOy3+BnuNRkBBvXp2+E5oOb995TUK5Ts5U/QvC/nUkFCc7UQQWX0YjCxKoUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIfzjN4D0538IC2bHzEkwhPzW7nD0j414Bj7CS4Xb7DDWOhYkR
	I5GeM1fgNjv2bQCnJYwDbnKl3l1jumfnpYcAQtFIkfHeXVx4tj9mmRxI
X-Gm-Gg: AYBFou2H126o8HZfNiICOTAXWE6m3+Vj+LwN1/yZxUSUrL6w1ZHm/NGh0PNonviAXLs
	h379cBoupwlK2OPVayI5KCXLaY/H/U3FMK3l1MCaq+VlECJOnLeQigP1dKqRLaFCFBSYWuLc9F3
	wM7Ei/cjm8QKmkppjDj/YPsK1+3RYR+XBzhUFAUj+w+KwKJEYVTAWLPyyPBUyuAr0CYY/du4sSW
	w0mXrnft3FW1GnPGWgZBOH9n2vMlwtbnjr3j3Zt5wKT1HanJ6bf9xHrFlxST74Z0ev58OMz/OAd
	YDlqpgqLD0Mhnxdabr2v1WujQw3GeV9dzY2qMBDCduwmeWbOQ+m2UiSRqsLdNKLeOlqICU/sNcn
	CNq1pEqihlZMSCBCJ7p26Wwpa9N+p1KKusO/2K64JGcnWzmWUgYTtgPUU84g0PDzQuUc7UV2taI
	79bML+VrA3EP4BTOK4S8kJhVAKnt3qMKiD14Y4tMamDIInf4zVC/XW0BSukGeguFjWEYsfxFbxu
	F6oxs7UMN3M4I2tdkUBmTDnoXnb9RXogL6dm5fwKsIfKXnMiizVrnlaNi/np0JcSItUu9XKunpI
	MBHcNbOyTnEUAiOWLyK2zAaJ1A==
X-Received: by 2002:a05:6a00:2d0a:b0:89e:92e:4211 with SMTP id d2e1a72fcca58-8a9bcff6a3dmr946518b3a.16.1793331206869;
        Thu, 29 Oct 2026 20:33:26 -0700 (PDT)
Received: from kdev.. ([187.15.154.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ecf5665asm196545b3a.7.2026.10.29.20.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:33:26 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>,
	Bradley Morgan <brads@mainlining.org>,
	audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbnpreetsingh@gmail.com
Subject: Re: [PATCH v2] audit: annotate the lockless read of the audit control lock owner
Date: Fri, 30 Oct 2026 03:33:20 +0000
Message-ID: <20261030033320.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008034403.7-1-bbnpreetsingh@gmail.com>
References: <20261002011712.7-1-bbnpreetsingh@gmail.com> <20261008034403.7-1-bbnpreetsingh@gmail.com>
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

Hi Paul,

Gentle ping on this v2. It has been three weeks, Bradley gave it a
Reviewed-by and Tested-by, and I don't see it in audit/dev or audit/next
yet. If you want something else changed, tell me and I will respin.

Thanks,
Babanpreet
