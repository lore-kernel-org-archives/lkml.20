Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F7471D16
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529909; cv=pass; b=LymynKR3sRvWgURBT6erJFK1GjdAqosMh7GmVxvMPbwsJ+DRmuBCr4UYC5VmVxkWn1iUt0QfQGTM3Z44B0MPEgEj22bbijPd8kIwiq3+YwyWPrSeLa+ccZZTzvRHqcyf9uekCj96uOvNzSQ+txgbl7ET6WruMQxESIGFAQsuOUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529909; c=relaxed/simple;
	bh=QrSrgKSf1hovOqBLTLOsQ+qxIb3eiOpoDqgK2ha+Ntw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiXIA8XXYzrnE7VLSTMw2Pw81lRMd5hVFbSyF+7zCNNr2n2e5FAcEXUXIekgMajuuNDUmyDhIzzn8Rv7vXYAGem4RdqUix+2u4CFhuzH0HIQGzPhq90xwhMu9FyLTPG0VxJdsV9ZdgcDULooZ9x00/Pu/O/Q7fLtjhBzwx+LduA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bpyq0t1D; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bpyq0t1D"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso7639333a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529906; cv=none;
        d=google.com; s=arc-20260327;
        b=MV3mJKwsJolMX1AxvkKfzbEw1iLv1g+ZDDqzh2Nqt41aS94BzBrjqFjtw8NfvtI8Sa
         amJLJ5oaylCv2iIFW8ssdSRY97pNaW6HgBmP5lsJa/Tcz0oNCj6kTWSppPlAghteNuzM
         lGwZ/rSCf8+LoK1XrmMeoEvtWr5H2IO7k2jn0KcpEJ9jBk8ZbU7LbAMJ5CbghQ4IkKrw
         gYxA5OiQDLWajSsquDTxxTcMqIDr2bEfz2hcaAQTya5pZ0f4u7nmMU7BfSMlqhubqp+5
         Ej6OBlSZRL8BX3vkHCqpIH6yt059CTtX2tMMwCkPWptW2C2q/JQyns/ElUk4R7Jde9wN
         x+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        fh=vWQenNNhwqMgaHhmLcncXAqkKFBO8FYheuVUWzPl8rg=;
        b=fEMmYoTnqCu/mO28RIV1K9GtjOYyMBvrVeShmrQ/0r+W8OTUTeVkbmFdq6OXOnfRwp
         0gErooHWRwkP6Yh9pzsV4fWhc4ibVwFAkS0G5bFN3l6rqnBGB6J5o3saLXcp0qwecHHp
         wD4otF4GetglFIjI/1v9Q7M209tyFcdYAcHTmyVX0Cr5uwk5ded4+JVuC8RGj/CIWyrX
         MDb3DjPJxnoPS/E3FAoDyW6Iyk2ML0y/KTJ91ICQD/vidWHm7hU74qWcV2OjjunwrMxj
         YFMo5vbxetDDeXN9yjw9b2GiP5n9n44CwpeBHhrnFpYD1W6lbOidhcpWDLOEIHSHNl2d
         60Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529906; x=1792134706; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=Bpyq0t1DmWGdZ/7H/Qb0N95TunBunkmL7hqaAnNjbDiz1t+i6nvJy1HBPAASyNaNOw
         QZq6DLBBRZbncsY0pYlKu90vLvdFwrQjVXYKyMJPEZvMf5hz3K3fwuKatxKj3sWw/NKo
         o0g3cz3vnhL3A325i2q+/0iE+4DBw1+ZPDDfXfFHPmxvDq+8t3gorCfE8V+iqSBAyYt8
         0KKeEHlTyXGwGR+GGk+ObHWmnpi7L3pSXns9aKg0S/PbhcMXWUcJXamjxjyqcwvvPrJv
         9h9sUvmxZlqfPIJxJDrWJOHirnnr4T1rZprjg7Zd0j1hYldp+9ag3hd9aCW4TXvPddqf
         biDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529906; x=1792134706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=hH/2Avtwe/c1buyrxwtD+4poc5ZYn4HFLGFUSMcL8UW74l3cmonNmdR27bCwdiPIA+
         2y0djFSVUC4MoDqmr1cNqaznZeiCesvh6ALjh+Z/aoAhMMef/YvF/0i33PPqw5royl0L
         4G+HPkgRrfRCG0ATXRB4VjPWqdBmjJHMQ2Nqn9gB+nikOYmEcMXqW4s8/qipzXZqNuF5
         wwSDVYcxrBFvSaC3hWhtG2GWM9BpErMviGmC7V74+yEclczKRegNc0uzGaYlF+SvaufQ
         03tMyL/wxx9etMPW5vs/xJzcNcGDdNJIlhTucktrYG7lbGWRii4AEKr6k/oME/em86eA
         X0+w==
X-Forwarded-Encrypted: i=1; AKwUvBweKg4Vdzd8l8+zikaWRy6cSEQMppqLNP+uFaXh+yMjCAK/3dPRf8PUfXQTjM42ARv21+jHvKR3/f+u6Rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2duID8Eou6AnV7d2a3WXHMyFzBJv1su2jBcg0Mf455/PQWy9g
	6+naIqQnbsNqoWtRmkIvanveYPccM5MAet74WG5nIj6fspNEOhYr8BmivqprZivGdb7YnPhSnjE
	Xu0ZgGv1BZYC/A00eJvhxiS+jB12LX9E=
X-Gm-Gg: AYBFou1NwATUtEkRnrnPfZTelpuUrqSk9cVLCoYnLuW429yNuo/iK58kU7pbgss8KH8
	q38udqEXXHVbJV5v3FlI3whC8dX3gJkWEmLPj80klD4Xeuo0S13WbmH86xtXFz/HcY1WxCuM/Kj
	6NkWhU8kwkS+nT4/xMsif/YoM5CHLEsM0Dq1RlVOUydWm2RPf0MQH9UmnfbAtx5gtWe658ekJJS
	SB1eXHflfW/IQlj/YGD04VdklDf3DEctEuIx0p/ZtiizafWczQxzHW/IGMKgGV8sFnCly3DzeMH
	/Zb+5iIcb35zot0FX1nnXVO//COiyyYza8pImsraLASUpsTCDbnX9GaB8eWza3hTk+DCT4VdJw0
	eL4iPTtOuA6F/C1/AHtk1LmRYkRAN5qi851Js2eiaVd97rVC3Bea8pYM3op843OSvZbY=
X-Received: by 2002:a05:6402:42c8:b0:6aa:9fef:641c with SMTP id
 4fb4d7f45d1cf-6b17c2cbe9emr672146a12.28.1791529906210; Fri, 09 Oct 2026
 00:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-6-phucduc.bui@gmail.com>
 <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
In-Reply-To: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:11:32 +0700
X-Gm-Features: AclHuK-rdOMioEF7bIiE384aI3Wbo4oyl4-CcCkNK2w8cU-mlh0smKvKyqU9pyE
Message-ID: <CAABR9nHpfwZ3Ma9pOTiY5eMN01Exfez1YahdUL9g+HCq2gwDXA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Should the START/RESUME path check this return value and unwind the
> trigger state if enabling the paired MEMIF clock fails?
>

Yes, I think it should. As mentioned in my reply to patch 1,  I'll
wait for feedback from the MediaTek side before sending the next
version.

Best regards,
Phuc
