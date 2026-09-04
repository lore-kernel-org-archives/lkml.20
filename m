Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1C38DC6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563868; cv=none; b=JB4GYlpZu451j8uO/jYAc48CakZ4hRJybl4u18P7xBdcjpuOtLlKhUjjCgl6FQaHU81Lb1cvR/jSB/ETXfYY1upV7jFBl2lD34J0LTIGZb0Fr5uE2M4iws6ALS7n59p7sEEsYb8qp92YgTiEXDatiW1UnpYNnG8qQWkczrMuCL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563868; c=relaxed/simple;
	bh=A/04IOhzca9uffUMpozsBDexgxl0SILtBWiA8ENvges=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuUjcdKqRLUHUXpn0ojOzLi6UXcQqw8iOKoQqa1xSW9qoZCq+CDEErBRY76OLI4XYDUuI5NQex9jvzrkUUcyesnT+8h0xOV4jQHejXLazwVa7vLOT5TSMcc36XUa0IdB4fFKUG3XRFMJzs6A/abTp+41VFkrAypw6JXIJ+f1t08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UCNCjcUy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UCNCjcUy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so2140034a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788563867; x=1789168667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIk52XWO87XyisUAZMMmHhSekpI+pY0wXT0ih9gfa9s=;
        b=UCNCjcUy6bIUE2CqLl4AP1AdA4Rtp9TutxKIfdcQWoszogzyH8MfHq066IRlD1XBXR
         0eIhCtOJu0dxkUEi09A9dk+fMJbYawJxw2/6CNJK6flz7UJH2HDrbtJ2y9PI24hkurER
         YFpM+408mOjhCQZ6XfGGfd2HCjOCIWQOcxzgKvdvc8IAbdPgtsPdzHFXWfWo4fbKB0Oz
         ute/CmY+OhJR01R+U4aydruwxwrF2R4BuSzv/qAUyAPcgnGn/SEiourp2SkPavw3CkP6
         3JEhQ39rG0MZHvwoABiTOXSjL76qYuosGSOnIkfY1lDKKdDY+ttdZT2jzjrHPR4Lb7ZW
         12DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563867; x=1789168667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIk52XWO87XyisUAZMMmHhSekpI+pY0wXT0ih9gfa9s=;
        b=ACMqbPAkSwAJ9iOONW01JWZTX47tuIdQyH5IInVtvZgvk7/+JMq4bzKgRSzfdH7Xsm
         DUoKONNiJDPDyhsAciS8IRBghGlmK4fYXMhgmHiPj62jL/Q+bYc7f2/Et5wFscChySwy
         xzbgxcoKU9sfk01rFeVoynyFIP4u+0sTNRrUIQmnc6XQlxFWceVriGKp67hQWhLZpcVF
         oc9s6psQxTFLEPNWZtDwPb4sgFLcQhiRYFSFDl6sbFyI83MitYRSER6YFQqTbBw90kuJ
         kQhjqZiRdHVhH2E/EKAMOiu2Ul5Lw/hUlh4XaXakltsiQ0jGSYEJH2FChwiiJu9uFifk
         YEJA==
X-Forwarded-Encrypted: i=1; AKwUvByNybDs291e0Utv2IJj45M2fTGbnNlykYTMKoE7n/ldB+1JsLmHPmPsAXrye1lgqUVr7sDcui298n1SGcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lyhU+TW2hrDShvZ/BIgAG20/YL0KQkPlftVRJdxQVyM5oHauJY
	TQp+NgY6Lepdcx1A1b2lucdOu5KlqagaLqTcVm7se2Xz0gA9jkIr+OIrOz38s/URSSU=
X-Gm-Gg: AYBFou2i582cuTJRneGNjWr2I7TQ+ZArj4qxfu1ikSuRKTLyGrMVm1HDVDWiuX0UuzW
	ldgyg+2FOfqg/8Tqh///hPO+JLmea3m4NJP5bzDOljbSA8AwKX6M3cV4NtAUd14URTmHVPLK8RH
	q0Tnlz5opEsLZFRHhiV3vklTsL3QgR/yUlWf70BN0GoqB95r+k0JZ3DwL65C/C18L+4T2MLsO/W
	gYt9uoM2zmcufuEUHyQr23fF1Sl9FyG/fsz9DfW/klj9jR10bRH0u/1K0YwvFonO2CXN4ia2OkH
	YRIUVyuvacaZJsC9GFNR3HVCX2eSmBe75qD9Yif/+AlfJEEURK6QRed/oPq+huWWFsVizNw+oT1
	UqKgF+R9672PaIEvtc5Gf7+lb85iL9S4RGv4NPOX5lrfrV+jPzOob3Py8EkXj7AL2gQXlN989EO
	EtJCYL/7Y1m6y+wLBHz94TgepN06ectoleryO7DsuaksotgQRf1lwhPfy5txuUhSEERvCpbcvpz
	SkinEg=
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr16044908a91.12.1788563866851;
        Fri, 04 Sep 2026 16:17:46 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm14779392eec.15.2026.09.04.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:17:46 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:17:44 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	James Smart <jsmart833426@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Randy Jennings <randyj@purestorage.com>,
	Dhaval Giani <dgiani@purestorage.com>,
	Aaron Dailey <adailey@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/16] nvmet: Implement CCR nvme command
Message-ID: <20260904231744.GE5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-4-mkhalfella@purestorage.com>
 <6562686c-1a38-45da-9d99-bfa9a9736fc8@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6562686c-1a38-45da-9d99-bfa9a9736fc8@grimberg.me>

On Sun 2026-08-23 03:53:03 +0300, Sagi Grimberg wrote:
> Would still like to have it simple where nvmet allows a single ccr command
> per ctrl such that we don't need to build a list of waiters.
> 

I think we need to know any point which sctrl is resetting which ictrl.
Without this information it will be difficult to implement CCR standard.
We use struct nvmet_ccr for two purposes:

- Generate CCR logpage on sctrl.
- Know which sctrl needs to send AEN when ictrl exits.

> Otherwise,
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
