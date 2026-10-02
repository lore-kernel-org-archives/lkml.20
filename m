Received: from mail-wr2-f18.google.com (mail-wr2-f18.google.com [74.125.225.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32B4AEBC5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950716; cv=none; b=uJt37J9uBWAMa200AEIETKvwlEdIc0KWtXiszGp7dGdNMfhU/DO6johTARah67qubWowNzpap6iHXd24eFujfSXzjy6IlZqoiDMBkhQccmadn44rkXtEdbK7cTf4mYKbHy9fSbsvc3eBgQFJeoL3o/EaecQ3LQuefK7qFUTVNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950716; c=relaxed/simple;
	bh=mVrY1h4VM0WjmBdXQxbCJ0p4pbr64cOHAzGY03MhcDE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INypjMUvP2cjaB38UQr9V8dd6f/XhKI3+LU8XEgfl9Yg1MV6t02aEnSnyCglAiAMWdZ4hCSlqUzRQeDRXwjo+Yj5kfsHMf5GYjlDv/Y/HzbBcEa/q9MJoghISr2ySkpfPKNTp8DafgEnetlXPQNUnsl0h4Ahq0c9frigrgppRLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6YZesFD; arc=none smtp.client-ip=74.125.225.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6YZesFD"
Received: by mail-wr2-f18.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so1092754f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790950713; x=1791555513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTJy/ywZsqawpC6LBguje6pTwsPWoUHyJE3z7+IKeVI=;
        b=q6YZesFDi5uMMqqbXWa8QDGczU9asq1NfZ31hoJ0lni0yjpmGYbXuq/rerDQ3b3osL
         H8HveP23Kpu9GxvwycevHrPr27hqZSJ47MjS+8RlopyKrX9ipfsD2kClT3Ni6uFSK3iE
         QuYVl7lycZiik+dLIXll9mx9R+xISVo52LMwy5tjrO2gN68JFLuma24IY2vUPGrHEjy2
         7uvrbzbfFA4Au12PgdRAzldKbBPe/8THy/9guSsoPUL+HJBnk4nWAeKr/bOLrcj8zfY8
         kqk8B3a0qBhmDcY1mdJgnNUT3qslkq4VD9pSl/izsfwed5as+7YgpW0Qyk9dIhAonNYI
         OY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950713; x=1791555513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTJy/ywZsqawpC6LBguje6pTwsPWoUHyJE3z7+IKeVI=;
        b=QJg9hKPOsOXRSbGvL53yax3+SZysG6Ifzu9I9iYHmzl9ea1+Y7RBkwDa0K03S0ZBgj
         7TU3XV0hiw22/MACGylUWztLw8lbUe6KuwmrYe7aGzOYoFj09lLaYdE7IHgldiaiqgW4
         RcT1ssGMo5MIRs0QAcNctUN3tFG6CSOKLslAPfwfeKR51PimMf+/RjUFeVqaCBNDCNUV
         3kUW1t3X+inLRso4w35Qm7Jw7W/kW3yRP27EgZ4En2DRmmMgxN+FTuschiOi2+L8ONlv
         Lt6sgmTBh5yrA2Ud6RzShrpmm8JgahRhGvT7ZRcNBag/MCBvZ1YNe1LJ9GZXO9GIwGBT
         +btQ==
X-Forwarded-Encrypted: i=1; AKwUvBwntKG8nNVaIWO02pcIN43sWmHb2JWaTqOHT2suF8d89BSISAhXV2gXFE8kdnSLbmRtmRO8T5OEQYmb3xU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiL5QG3/9bf+fhNwNKIlaS5N88yu00oKaMUu2STfMV6gOgIITY
	X6ASy+QbtypkF47AcWAjdh9yRnz4wzYV27zYJQBC9IYFMwA6td9rr/rj9wyShg==
X-Gm-Gg: AYBFou2L11hVFAQ7Sj1BXpIdI6PXo0jKiX4wIg4gQ3jcgaXl6UkQvFsUTdc3/DNneXo
	xiaA6NjvjySOqOphXblJpl3lesEKHfC1BWYBfXBuM0MPxqcNzjT+F9lkvnOD2FNoQKFc9hoOHl6
	TxGHiNheicBWgd+fi17TdpUrctF8Cp0GVsjHNRBVgK3LyowyvszLrmCpjKJRed3Xj4y9qkJlLo+
	iR3ij0k+qL/t6/+EdFcstF33nBKjovRHRu74rOL1p4NpEQSKHzkLb4HfTVTx17A3Oz3m6Qg8NIl
	fmCpsHBM91rcye2tNN2+RkVjHoNF19zeSzuhB/zXmDawcvkrr0ETP70f5vvFZhYwuMPUWTcmSCX
	jGjYk1KPAlq9ufPIlCsRLV6EVjTsPf+hmX47JDmCR5/KaFHchVq5xx2fZGm6ze/qUNQLN7qz+qP
	dtiDGC0JjxlH/wnp3FOuTLRd92YSqMGH3dMeP4BGiEhCQQ2GbF7bI2wNmpj2loJIeqWPDDlpVD8
	YLvdIOhnA==
X-Received: by 2002:a05:6000:40ca:b0:48b:ef1:3101 with SMTP id ffacd0b85a97d-48b12754490mr4958512f8f.19.1790950712668;
        Fri, 02 Oct 2026 07:18:32 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm5684961f8f.24.2026.10.02.07.18.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 07:18:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:18:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261002161828.365ff859.michal.pecio@gmail.com>
In-Reply-To: <561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 02 Oct 2026 09:05:36 -0500, Wen Xiong wrote:
> On 2026-10-02 03:29, Michal Pecio wrote:
> > What exactly happens after kexec?
> > Why a PCI reset in particular?
> > Are we sure it's not a bug elsewhere?
> >   
> After executing a kexec boots on a bare metal machine, the USB 
> controller disappeared.

Sure, but what does it mean exactly?
Not even showing up in lspci output?

Is this our problem and not PCI subsystem's?
Are we sure it's not a bug elsewhere?

(Last time somebody reported issues with kexec,
it turned out to be an obscure Intel IOMMU bug).

Regards,
Michal
