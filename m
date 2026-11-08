Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172436;
	b=uWjhmZ+iRomtceYs7pB4fDOKYdiYPg3haTStVcW1Ytvfq6dSp0KN/OgOzb7377RvTpHi
	 ztL2SQO6b0pgB2YStgsq7o5yZvRCoKXUBWda+OQ+hod3dXTaad6AVWDT9WewQn6LlS87v
	 Q3Cq7x9xEhR/wpeF47zIuYsG+qtVIlZmRznaLhrkOhHw+D3/WnI5Tf3g9PBmeVkdX+15Y
	 snEJGZh6WODtF1Y5em/ihAWNhZWH3LiZjPKHXroHYFwRrhOh37QtT0uE8lq3oGEs+szAQ
	 De6hjur+WtqDHIJskFIfIg77fOpBaWX+LiJWDNbKlcgjIhSKmonCuonG61HPemf02gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
	b=xH6PPgEcU6NidzIiArEDBw5EidvD3Q6hN5Jt0cBSkCy9q+fHudppRtlogVxB1buXdobM
	 /J/3TzUqIxW0b0V15uiubmQ4+Gr4BEIXxdp4OujgMA4Lc/5COLMOUwn7jIu/3DnvToUo4
	 yBxWo+R0FqqMGV6l65tTTnY2X0ZiUfuTLulWyfTC+p442JGMe39eZB5NabUe2SjaLAJ1f
	 HPs9duI/DTbx3aVaZrNMM9IcC45AFiJI4QPYQqBDX1UmF1coDj4z1TC0lzz0Mugj17+Zy
	 Bqy8FGLiLmSvStBobELL/oHuapE5ioNXsvv3kStK0QR5PwnOY8ZW4jTVQxhsiYyXBzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh6bg9I8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B4606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh6bg9I8
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67bf27f179aso228635d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172435; cv=none;
        d=google.com; s=arc-20260327;
        b=s7iESpE8Hz0qv8Hb7R6lrmQ4G5RG7hPOxzvX8GINeXL9PWBwI9widWywJlG1pp+7kF
         1dUEJW4lqzJ4GfcckiroYqE4J0KVQdp47n8UWvdkdvRXHpOuSYfb1Jrx1J6C428XBRWj
         8MpoZNfJTBVVyJuKC7O5f5+/HRud2LHpodtJN1CYEI+ogjMUeBRmSNFs9+ZSBsHPUbtS
         8yKLKMp3fKhIJJzdOdJoCT2SS+CB+rM2XqdxT2a2avaHnqr0L355pXIRQ70ubaAdzM5E
         SBhXa7pJZdnSzX9uc1MZwT/APwAA+WgunGtXC4on7MxUPhEZwBeh3pjKsGbgaP8m/Rev
         dNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        fh=mvo1gFURhwqLRrN4wYLmbUrwhc4cUNKbT04V1dF7FIQ=;
        b=Kq967LCWTE45DpXQJE2tn/kYsGYsgR9D/fFpxihlHaViUruDk8APQnfZoew98oKTQf
         6L8Xck8bRm3RnLNf6xfRowDFI+Xjgua7UASrY+IlXFvdyLYfgzwFAmFaqvKBC0krCoY2
         vqAVgmCsKcm2PKDA66ZY8ImVzJpNaiEXowhuzbWDxXhWkkNQfsdBIahLEFCmpQfaNh7D
         dkfE6N+s0nQmbsrPfy9IS9r5FG/MgWsZrSDWL6/lNl0d1/LvmdO30wRBAQ8dbNFAbxxU
         B8e1SxzbOBsAEBa/F8WQxtR7pyfNOul8Ew14aidCFUzlCS7OTiMG2OurmpTR08HXU2RH
         OUzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172435; x=1794777235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=Eh6bg9I8Xv8aNFDUn22j+OYkxWliSEioMKSLE8BgeHxwbVVwjgCS4w3bsfjPJ4ULsc
         tQTaFKczOqjMhElp9c4h1W+iR/iSfwlHGKdudqCoP8dDhK8RF7xGPHUuAHDV/sf6QkMx
         Q93W7gijLM/FwZv+BHzx2+RijM9VBX563pjbbpro1/lU2DVrbn5h+c7AEKcx0bAmMbMI
         V71hj7E/Cim2q/CpycuXTa9zNcOByVbHn8YFH8/rmtrem5QM74hVAfS4gzR8hIxsjn6W
         taZuvxeObvJNFC8fu7xWwmx/wXuz8BC8k2rrS3/VYDfmgI4Iq3cOjkIwCvW9W3xYUxVT
         O4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172435; x=1794777235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=jahIoEIbZbj4wqRX4sZCO81UZjhU5txssV28tZT5zW3REduvoR4yzUqfV3VqvmRMCm
         jyLQJ7sXf+dyAnM+COrHeW6+hhSzJTM6cd5QKk9QUfmyO/0w+EM3Ym4ACGZgEy2oKHKl
         oMyFsEvkcJpPBR6bLKGAKYcMPvIf39xl0TL2X7x5uqshCd+ltgDhYH8vbgmag+MIFh7D
         qGEgBF6dpmXaBiaSaPiByTdlLTb9r1Bo736oKV1evJqMLM7/v0OGVABhumQF335qY3Bp
         I8Y2y9AgPzs/pHtSDC57d528pkDpQXKFB46F5S6ne49CJOPFOEavOKKWjkXQjF8fqFKa
         kZfQ==
X-Forwarded-Encrypted: i=1; AL+hErG3MjMNFRvD27hxurnJcN+zq8Kh8KyRjGa2PgKrzvqgyDPlcrHO+OUButiS2a7ReIghISPjC4vZXnBe+ZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+02YdimJyyB3LFTZSeubyWiXfpFqlbOulr8+MrSvARByHaGN33
	VDJAbmE3WHnt751kpskun9ldim25tbP8qBTuEUf0cEZaBOFKXbKDa4jv86MCy1Uuti8lmu4n7T9
	Yv571GKmAueMb7Zt+3YmkXLlLPToBTxM=
X-Gm-Gg: AYBFou0gq29rkdapklZJpobGj3NWSAQpg/MVNXeL/qSZTlvcnltGGXOq2S3OS4yKr40
	Ldk5YcaxuoU/6QRO6/9GbHRXOyN8aT+1ghLwpNfIBZVeFXJh2MBOsAlxqki9Uu0Ka05+DzUO8JO
	nYoknVWmjgXyH7/Mx+5Q2icHnRmwTdXzFw+smObtcQ5EYYEBGmp3TOkUg9ug0HhlKiyBtv4m8fD
	ytLmi5hWjjkFVIc+7AppeNJmYqaHeNUG4f1/RCEHlx/YP/EBkbLhnz2rNCzIGKIgDMqsFkFDc59
	lgUKdBKCE8NsPkEL6H9eowc4L7UBWc49rbfX0jP5oA1esTIM0VThTO+dVpxZlyXOjy5uL/BwKci
	CPCMsuOVXko1UTxEjKjKS3HWpgx4sIPFpCSBpt8NpD+36HAixu4exgtPDWAdNlzfFRNKv/g==
X-Received: by 2002:a05:690e:14c6:b0:67c:2674:6992 with SMTP id
 956f58d0204a3-67c3d7b92a9mr1205372d50.2.1794172434690; Sun, 08 Nov 2026
 13:13:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com> <179369963832.2329937.7183164129825631720.b4-ty@b4>
In-Reply-To: <179369963832.2329937.7183164129825631720.b4-ty@b4>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:13:44 +0100
X-Gm-Features: AclHuK8wx9FMQM5aByRf496tUFpAvyiGNK18M8rQvRUAwwPg-HD-rkEq4isW6Fg
Message-ID: <CAFBinCA+4iF4u5qAMh78EVqjLTrx+2z68n2MC76bFHUJYbe3kg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> > The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> > identifying it as a Synopsys DWMAC 3.70a core.
> >
> > Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.5/arm-dt)
>
> [1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
>       https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e=
603da0
Neil, sorry for having to bother you here.
Can you please s/arm:/ARM:/ in $subject?
