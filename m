Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794555911;
	b=CZc8IDTjfn7s3pH0hF4KGH7NocS27yw9QIlbjUFH+TUvb+fTzZ/RRS8b6wqG1qW5OobC
	 G9KM/QyzDuA05wMHy4iLNxIPTaGE2McaX9Lmgz31ue5Sh+wV3CPAx95CSeetasR2TorAV
	 955dte2pEF0t++nOomr1j3eD15gSKu2wGj4X1W3uCRRcpSuiSDEPCZLsbb9bG6YfmJxXt
	 Wlk1AMFAGqWYHOwULrl9vpGgda5TEWNnnts0piSLC+1N1qF5bt5L9CDBNcOGktEnlODYe
	 zLOAZ8mAYqTaN/CKgTStyWN6lQAdlNGejPM3WEru1tij98vxlhGVMT8od0QT35r2/Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
	b=OQ0k/w8L81nnUEHzuK9G5R99PH0ZUXe1+k1TUPOjrKi0W/jCuUhikSwLr2RmgDE7hlcR
	 A4ePkhfh01nvJzlw+HSFP51282UmbWF+m0swcrtPjYONV+ghlIAT9oY0TenHjkJMQJtv7
	 AqcbU2BrhlYSVMWsB6WDjQ7FQaxXQLG4ep8x7o1ipAQ7+dpL+lv6vwZPQb+RRmwH2JU40
	 m3bsVCQMUGwncHiggtXakift8FQ8qda2cbbjUDx6xtZ/iz7R7Nxt0i94jRW1+xGvfEMlg
	 6Vvp1ByR/EEp6LeMqx+PQHeXL+0DTKLqG8+6LEjRy6DnGghh9bAmmz1zsXLT7xUFXRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX0fe53t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0BD606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0BD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX0fe53t
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso1095971fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555909; cv=none;
        d=google.com; s=arc-20260327;
        b=iQRm+CaTOBzoSBf0N5tqcgLlHVDBhqgaW06uQwEFFzoJuHfsHojVs2ArFv4pGBgJR7
         v7QVGmZWnZAMRmmwVhOVL574XMKgwATtuBUYY9NHfQQs6ejAl1B4vkUFsx2AIADvuev3
         VHSeN6w5wAGq8n7gO+36Lt+C38RGjI5nHG7pCQYEI48NjrSKcnbsO3yFBbSVyqY9IVHr
         BFe/iuKLy2M6CYmWOBxhQOoZfioFUSCdiXvVPJ/sC9nqDXW7WOohfbh+mPEzRBE4ElOB
         ZVxWwe8/C9l8osZt2Sb0Dhb3OzXgUn+9jfqaolhYZcvb5ZImqnGGsyg/X0zrblr1w7fI
         +VRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        fh=Xtgy2yyiSi3AlRuGH/C+LXkzHZ9lsbDd4rJn0UvOrro=;
        b=nsF5fwEeyY8UNRlGbatpryje9sOx6hG9IR0WNMsN9NPuE7cPbcclIELlvbwC+nZiEh
         RIJXX10uViNOM4PbrrEssrm6zSY8SFuKSv0/JdwRBfmjfFAEk6SxI44JVAKAHFfvTQoo
         mya04v8So107cEOV5eZ9Et0dxDT0fIyKVn8My0y87jBDgfISwXgj0d993E3/zY3DSEnQ
         N59CpH4+vpqEW0nify9TB2MPORvrRYMfaQCTwjmmxieedIRPH0ccnT1rswNa6bZE3QrC
         eoFo7UC4d0j7UA/3LzbZ8t52Gc8p/pbYxgHghI0gF5P+xCKTDOwqzLcVgArF21jijMpj
         74bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555909; x=1795160709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=ZX0fe53t1HxoVaTOfHuPsA1VtFhkn+2so1yR7DI+LDkXXU6ame2LRcASeMlzlxOS+c
         kaJhJiAVoGD2zmSCW/n/nevzDSpeqRzrkKkkOzBc4+wQKV8Wy42mORne4zHXrr3VWIuX
         tD/HGaQ1rYvUV5Q7Ozp0ma/Rb3vGRtPfP4TOmLi4jZUxwZpL4GcfJg+Z9fswK+yNsmi4
         x0j7HW7eT/oJOlZvtaeHaLGyeRkBjgtg0axtMvAWajbnLflTxfVl5eiGA/TZm4eerbqW
         n6vmLn/3pLI3x9jW/7Z8iB+eZCuNTgbMyd53fYAElPbUbVxKjLP5xjZebNGznrVO0woa
         NtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555909; x=1795160709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=lisPv+dqFb4nUm1rXWuxzQklpPNHGIkCJ5C68pQ7ica8ZH1pkzFkEWWw11BCJ2vTNZ
         1+CcIC8assCkcUigusdEpHjEeBK/Sr0CK7Pqf9l+F3jSukC0ncWuRb+2aC/xH/ME8kIk
         q1F24v7s9Nj2+joXxgxKkYZkRxWFLj2lKC65JwadM/SObIQmFJ1Rvz393akneqbZ3RM/
         Mk2TFUWlNvTH8UUqkg7fGEG9iZVs1jJdzDru7/0goTPu4+ihnIuOJFnc8vvqRFnZgbW4
         rIccgvkZgUlA+TRQN8pkFkhbsxHE2aMsKQqQR2QbNuhOnlgAZ5h3FTWF95XFtNNSjLYw
         fJxw==
X-Forwarded-Encrypted: i=1; AL+hErE8e7xkC97DUuAkCXrOVmxHy8p9ErlxcF51QnrvdFgwBj/dE25hOkBUQLKZdvUVJU8AOKnLNlGnl3v80zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t4T4Nmqwq5G5l2sIdRCaVH+Lgxum6Ennc4Lg5nHkbZAsnocNZ
	AXa8fzaAQUcY3wIrQErTngA7kKKlVsAlLZuoyu5Rp1fpJnkW7sbgyEpuuEEHbezqu4bk+jhozbd
	8Elz+sZMILBuQ6zh+FXCPw5V8n+gGVB8=
X-Gm-Gg: AYBFou0F6mqZq7xFjbhb3ndojBK+YepYc9V4Uef1wx6EGV/2APix8Nk6jfgYcfpbfVD
	Hoc8+xnQ+qXi5N5FT8Uu3mPS+PPECcFbYYtb6Bg3wjZY8lJgp9qGE6U1LarWp9CGIhpyS8rA3pq
	vegeB+sg/bJ4MjmQTDikvscJO8mZ6cCG7lg9Wo3TrvsLWOuH+gHPIjo8X7BqhszabwzHx5HHBFX
	gmiSDPCNoni6on+1mhzZG+jczV6JJnxgLDB6N5vtCLBee5HF+GA2JMtfB9c/vtt2hFF7Oqqj+U2
	R3jCroqRQoQsrFNG6nf2wqi9F9c1WFJHu6y8XIib5Izk+bjGDzCEPYhYcGMyCPJQsw9ec6CGcZJ
	9JT90qybY4jigpIp6aFwhY8Kacw6R+ZUXODNcuKEgrkGUPmy1jDW4mo0jEZrrIH8oQjhe1qz0Ik
	bCF9hlilmzhQCPheAsrA==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr758264e87.2.1794555908550; Thu, 12 Nov 2026
 23:45:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com> <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
In-Reply-To: <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:44:56 -0800
X-Gm-Features: AclHuK-px0U6hKw50ELPgjTts3juNb6KJSAEdMlgQ9nDhQ9zdUWQkc1yUvT3LMY
Message-ID: <CAEy9hNXiBRaj-JtjOAy4de_BQV1jAKUjUCkYzSpksu605HTNZw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> As you describe this as fixing a stale state accross reboots, does
> applying this before the tcpm patch degrade current functionality of
> the device?

I don't expect it to, but I have not run this patch on its own, only
together with the tcpm series.

Without the tcpm patch the tErrorRecovery wait at boot ends after a few
microseconds, so CC is only open for a moment and boot should behave as
it does today. A later error recovery opens CC for tErrorRecovery,
which is what a self-powered port is supposed to do. The warm reboot
with a DP cable attached often fails today, and I expect that to stay
so until the tcpm series is in.

If you prefer, hold this one until the tcpm patch is applied.

Arun
