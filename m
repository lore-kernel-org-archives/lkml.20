Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026647;
	b=bBEBDy4S7wq/uBlm/pHlOePe4ZVT1hSZCC7PcsakxzSrFYE7TgiPfhGHVSI9t53C3Y0H
	 Ov9unMd/EseFrJe/3FWlAJgGxrAEmNvR9hgunX0b7UiQGnDRfjB9q/lM0vNK2Dhg2CcvU
	 PeCweUeuw44FwofQO7yqc33d8SwRXWTC0b0CAfWI4crZOG2dYV52SBjog8T3Ae7NxpNEX
	 4qZkC29AXHHW0F24L8EL9BGJVJhRxGEI+c2svAgmoxmLwFeSFhVlMvTwTS7z24wvbVx5h
	 OY51Tx/6+00fPTdw6ZXJdIw72ZnOX1joJUXc61pXus3eJacv7VVv6KgbtwkvuMyOd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EtKOfsTAyaPtV1waU6HbA1vsCK1xlnynFhw6+u4iHx8=;
	b=hCtvCed9E6JAuzJwITZQ6oYoLtjpQXN7TPveqNMslXvSoB9vkrojo9hf0E/5xbdk2nK9
	 utWM5J7PrUfigkzNMq8q0wsPIUNbvMW7Yk0317p8fCN8g1EulA6u5SSP6vB1QyESRlV4d
	 iRve4qoYeTBlbY2g19ALbDx+eynbqTsk/+dDSuO1ZKi4ZlErK3g19RpqaqTpqCANznZ33
	 +uPY47jfcp8pOxo844mMqvbUFdQyENSjDof57M3f55THwVoEq05cvUOD7JzHDFRV5LZqF
	 MZhim7YxUrOuPLBoRH9ub3II1upxJAa40Y28mIy3KBm2k2W3KaDeg4YQWw1lpjWE7Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AY7b3CLw;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0735606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0735606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AY7b3CLw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso31449845e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793026645; x=1793631445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EtKOfsTAyaPtV1waU6HbA1vsCK1xlnynFhw6+u4iHx8=;
        b=AY7b3CLwgywyBpBReinIxBM/g7nwl+q03KPQCh4GovNPZkxq/jV/lQYe0K3X013dpY
         mXNLD9xd1fIe8yKwMntgyJncYMaLNrULAHE94S3oRJws+GDV68KQwOtZCErC9yaMgBO/
         Pa9m+pUjYxbHQ4sChqznZ0OG81ugyZdCPA7NkdbsiOrqQoBTMfawheCyxBjE4gcEt8b1
         N523KRTTJPqoqPXJMkqXVYmmX0DGAR6Xp3jy63/6p8iAPGg9oPkC7UEMypZWrNKe1yKr
         JihsTu3rhtaAK3DsGPBA7c2Ixf+C0+eTesWxXTXkXMkfie8vtFkQ4nQuPsJmRha9eJYC
         IGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026645; x=1793631445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtKOfsTAyaPtV1waU6HbA1vsCK1xlnynFhw6+u4iHx8=;
        b=D+WZxDWOwpBL5bFzXUnt8tAxyaQLO5w5pr8LTTrGrw99V11HPlzuDwUToCT9vekGkz
         tmnO4aK5Vdlg9kSrDxTx5QT0WEesNHoaFES1J5rstGwWskVhuSFaaJOKuHiUXyUpo/Yx
         5YYU9Xt24ZLnMi91yuT7rZHKMzHdjm25R2FHgk+90VGdjdgY2RfZazdt2jfYFKA2b+0k
         ZkMTO4hFTl5YZUyB4pYKveY0I3XMq1bpLKcDylWbI8rVq/GfpzdchL+mdE0tbtYJGrOk
         qIoQa60W3YWB/UW3Oky6dOlVaegXoIliPYC6jSkTBHFJNoPFMF3rVjGG32Y1EMYXaRI8
         CUpA==
X-Forwarded-Encrypted: i=1; AKwUvBwajzrYIr92J3FMDC0pYVa0pxPTJ6jBwPgpJ5etGKBvkGOz4VRFRd4QfzKpFrJnIHC72IUlxQ4K8lz5pag=@vger.kernel.org
X-Gm-Message-State: AFq9FYISNu+U8rxhFu6YNDUtvfdz+1pWX0l/QQVwu0XlWE8kP0m2sXQr
	oa+3oxWMErRS5j54QucNPVoSyM5vH0DiUl28VAUtc+Ska0m0/w/8qTBzsAPlkAF/WUOKUHv6GUh
	MIPhnU/I=
X-Gm-Gg: AYBFou0svNSECYTyn72TEy7JZKBYtZKBDSWoU57CAmAB1l8yANquNiE63daGrC/AaiB
	FNRmcsroutwIt5rw3vSw2+G7ba1sHbNoeCOPqgXpV6gq8KVefEKivyC/XBRE/+Vcoe0MXTq0Ijg
	25Idct6jy1dzKzxNE5sJPg3zsX1lnQjR9sV//Vo/hEAWnLEoDEZrzxtwhlsn29NNg8cvVKbHdP/
	JyqfGshyHny5u82Ew5bOWlkn42+QCrERPVw1GXv2i+WSu0TrefJcVfsi8LZD35zSnGiW9GPGzLT
	msb1MDS6OkAT/PbDEiR51fMNMcI0WWlyAaOtpDwwxU5yOXPbNOFYco5RHksmgv45qsM28ocCF3a
	tTskiZ5/r0Cy+Sd3g12P/GpbfLUtUVnw9hDibjhB2XxDVwnQ4GyX1NZV3WeXeZeBmjHv13T0AgE
	UpccGDuKp2ZXo4IWeDrnWIBeGC6ohGatH9Ey854N7RgtOx/jQrG7dLznD1YWDn1oz9xZ6vLVpTL
	4xX0B0iMMg/5p4Q+4aAXLbkNejqYbKOqBaK2k/uwkFvw3ckqGK1rWXr
X-Received: by 2002:a05:600c:6212:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a35acdd912mr122317075e9.27.1793026645205;
        Mon, 26 Oct 2026 07:57:25 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm16082701f8f.43.2026.10.26.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:57:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 26 Oct 2026 16:01:17 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Alex Elder <elder@riscstar.com>, bhelgaas@google.com, lizhi.hou@amd.com,
	herve.codina@bootlin.com, daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
	mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
Message-ID: <at9rPUyR-X7bRgBz@apocalypse>
References: <20260924222444.1351466-1-elder@riscstar.com>
 <ase6toUhGn0XD0v9@apocalypse>
 <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>
 <asju_HpgXpIyAFdf@apocalypse>
 <a8f7eb6c-69d1-468e-b7a4-7481e429c1cc@riscstar.com>
 <as9CMO8gODU-jazS@apocalypse>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as9CMO8gODU-jazS@apocalypse>

Hi,

On 10:49 Wed 14 Oct     , Andrea della Porta wrote:
> Hi Alex,
> 
> On 17:30 Tue 13 Oct     , Alex Elder wrote:
> > On 10/9/26 8:41 AM, Andrea della Porta wrote:
> > > Hi Alex,
> > > 
> > > On 10:55 Thu 08 Oct     , Alex Elder wrote:
> > > > On 10/8/26 10:45 AM, Andrea della Porta wrote:
> > > > > After a quick test, it seems that it's not working out of the
> > > > > box on my RPi5. Let me investigate a bit to see what's wrong.
> > > 
> > > I stand corrected: it works perfectly. So:
> > > 
> > > Tested-by: Andrea della Porta <andrea.porta@suse.com>
> > 
> > Sorry for the delay.  I'll add the above to v4.
> > 
> > > I think it should even be possible to tweak the static RPi5
> > > DT in order to make it work dynamically with your patch. Can
> > 
> > I suspected that your static definitions *happen* to work,
> > but I never took the time to confirm that and understand
> > why.
> 
> As per your design and as expected, the static range is preserved
> since the conditionals make the function exit if the device is a
> bridge or it already has a ranges property,o it all works as before.
> Right now the RP1 is acknowledged as a PCI bridge.
> what I meant is that we can maybe amend the RPi5 DT getting rid
> of the static ranges and tweaking the reg offset in the subperipheral
> nodes. I will do some experiments with this, but not now in order
> to not clash with current downstream DT. Definitely a thing I'd
> like to try in teh long run, though.

After some experiments, invoking of_pci_make_dev_node() as quirks
for RP1 PCI endpoint and getting rid of the ranges property in the
endpoint node makes everything working fine, which is very nice.

Regards,
Andrea

> 
> Cheers,
> Andrea
> 
> > 
> > > you please provide the relevant PCI DT nodes (from PCI controller
> > > to pci-ep-bus endpoint) from the output of:
> > > 
> > > dtc -I fs -O dts /sys/firmware/devicetree/base/
> > > 
> > > taken on your reference board?
> > 
> > I'll send you that in a private message.
> > 
> > Thanks again.
> > 
> > 					-Alex
> > 
> > > 
> > > Many thanks for your work,
> > > Andrea
> > > 
> > > > 
> > > > THANK YOU FOR TESTING THIS!!!
> > > > 
> > > > My hope was that the recent change (to avoid doing any
> > > > updating of ranges property unless it was found to be
> > > > "empty") would avoid any trouble with the RPi5.
> > > > 
> > > > I'm eager to hear what more you find.  Please let me
> > > > know if I can be of any other help.
> > > > 
> > > > 					-Alex
> > > 
> > 
