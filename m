Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E493F6C3B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270013; cv=none; b=h8cZPNc0lturmvYwB1GdtdG+u2YAXj/oRJinrniVeeXp+fgVKod+Hfp8sde0INqEGQ/LdsQP4Thn2cryckbK0u1a6MzLxu+BKiyclehRJd9nICLq6SzdgEr3ozzCPMRuKQgS2wRdhg5Dj78tJLXi/cnh6RsBaQjbvD61vS15WWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270013; c=relaxed/simple;
	bh=NlVGT5yDjIzEqiBTaqYQwrYiilceDENMfW9SL8LSjc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rz4d1xdtmc8/YXXsdk/Qxz2m7FLOBA657Bm+fwSyFMA6ahvYpQXyc8moS2GWZZywtVkGuBpqjBaqgeeHS+7TkojnGXsjj0w6u32XLMS/Kky2+dguV+35yUyFJztpPoVBako4TnVrcTrbNWYA5QtXdvs9cPvbkNIKcz+xmReaUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYsL0PaU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYsL0PaU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so593615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270009; x=1790874809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ij7MAN7W+YzHEW+px1HCxBjC06Pm0gT3zC5V96sK/OI=;
        b=pYsL0PaUje1uy/FlhVfdvCOBrC1j0huGjh+TB8rWLQPGoGf5sGzIghWd6dN73RoEEx
         4MjqgvGKQ4wfAQUTZTmIXjr+whnvql/PwPcwUjOTLQuFlLgXts7/E+OtqZ/3fDJHx8oY
         DXV/LjTUX5NcR1pFUO97DlUuimeOL/Hxz5g7K5/RRHWoIdVdaVJBFBfSDFvuDXqK3VaW
         QGs6jj8nMSaU5qE6SnNQDYRcxocIm0sftw+cuWhTryC3hEv25saxfmJTl8Wu7Fmx5bh8
         YtSGCMtzftY6kQX0vQMmdOSfwZWdSlZY0gyyYJ+cV5zwfjMQnavHYb24NbpYHB9OYVGg
         qp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270009; x=1790874809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij7MAN7W+YzHEW+px1HCxBjC06Pm0gT3zC5V96sK/OI=;
        b=WeBBxa8pcCSfKk92WJJqbkXkYZnUfOrzbNrfv6BYYegnp3Rus4TCjRdXUFPAD0ptsk
         /U61Dngkr9OEGmzLE5lIWU3xfQ2M+i6NLUyDuR8lyjJ7x803xmgGnhmHnnXiHubKwXJO
         gEMbrYMYuPKM5pZnvA6x6jIgMhHe2UPzLswZS927eA4pSY/CFgGz94nk6jppv0wQULxb
         0zKM43fGONbHlHiPTN8EX+UNV9MJuAytkECprzYFLRLzuH6aVCD36c1N8W6JRJBvQdkL
         +aaeVafXP8A9O9KwlCk82aDjUH2AxzsTaKEpNE7GAovMhkV8Qu/uIeWKUyNZkLWHjQTS
         0K/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzHwWiLYraASMe/a22NdE4H4N/+u0OImTKWCSBDHwYvd3KJe0WHI5L4w7gzVc9JbjL/+4SIIaaFfV/EHo=@vger.kernel.org
X-Gm-Message-State: AFuF++kZkcoFbml5R7HCz9ZYJefiFsOafUAAkeWcW5KIVSR+1Kml95l4
	vdVqyv2pUs60p4wKjX5rHrSGEjsKvEHFRXMkfH26DvOukmAtOxO5rzES
X-Gm-Gg: AYBFou1ZMm46/HbIshwQpinxvIEgP1wYTaYjUDjOcRJI6WjV7oZKxuzaJW/S2izXDBC
	tub1BPnmAlBuxhuUBHhnaDokWB9g6xi1picJwPwwECxyKhS/+dc81oz/q4xQKqC1WdKcFFFa+yr
	HMGz9Vb0wNYaJykt+MXvtE8dNGnJxsKC5AFwGDSw4l5qvmGpaBblsUqDFty403h9H+ncNkAg7U+
	OqZV5ACq+ZdkDAsFT0xzYGRGiqcflNNUcIh+HXiGbUXeN0h1Id4cu0rpK4syJWmBH8d42ZqIdrK
	ssE4UVPcnDkfBy4gRyuZJ2x5P0EgqBFFimdzCvlws1BF49ArZLdYsRETDHl8wfOf6aLqvPYNIJe
	BlczpYth60W3+pMaTrv/WZkl7NKH2CVXQjpUspiOQoEJyPZTXHpoXLvvPRzzpF2mbmqYq5sR12N
	dV3GPs5UHYa/NissOUWNc4S4u7hPH0X1WBfaKDIHFoLeyK4KdVbgMaL7dPZkQuxBpwr/XEO6EL/
	Mo=
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr56773715e9.16.1790270009307;
        Thu, 24 Sep 2026 10:13:29 -0700 (PDT)
Received: from NBLK-WAX9X ([2a00:1d36:5f19:6e00:eb69:2262:593:ab12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm86170695e9.15.2026.09.24.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:13:28 -0700 (PDT)
From: =?UTF-8?q?Ata=20=C4=B0lhan=20K=C3=B6kt=C3=BCrk?= <atailhan2006@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Jerry Zuo <Jerry.Zuo@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ata=20=C4=B0lhan=20K=C3=B6kt=C3=BCrk?= <atailhan2006@gmail.com>
Subject: Re: [DRM] amdgpu: HDMI FreeSync not exposed on Samsung S22C31x despite AMD VSDB
Date: Thu, 24 Sep 2026 20:12:43 +0300
Message-ID: <20260924171246.17280-1-atailhan2006@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CHXPR12MB999220241D7681B15420FBA721E5822@CHXPR12MB999220.namprd12.prod.outlook.com>
References: <20260923002718.5915-1-atailhan2006@gmail.com> <696580d8-cf2e-47aa-8616-7d930c2f5b82@gmail.com> <CHXPR12MB999220241D7681B15420FBA721E5822@CHXPR12MB999220.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============BOUNDARY=="
Content-Transfer-Encoding: 8bit

--===============BOUNDARY==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Alex, teapot,

Thanks for the update and clarification.

I've attached the raw EDID blob from the
Samsung S22C31x monitor for reference. 

Good to hear that the transition to public DRM parsing for the
AMD VSDB is in progress. Please feel free to reach out or send
any RFC/test patches my way when you need validation on this
hardware; I'm happy to test them and provide logs.

Best regards, and thank you.
Ata İlhan Köktürk

--===============BOUNDARY==
Content-Type: application/octet-stream; name="samsung_s22c31x.bin"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="samsung_s22c31x.bin"

AP///////wBMLRBzRjdONQEiAQOAMBp4KqHVq1RQpCUMUFS7jACzAIHAgQCBgJUAqcABAQEBAjqA
GHE4LUBYLEUA3AsRAAAeAAAA/QAwSx5UEgAKICAgICAgAAAA/ABTMjJDMzF4CiAgICAgAAAA/wBI
OURYMTAwMjEwCiAgAeQCAxyxRpAEHxMSA2cDDAAQAAAjaBoAAAEBMEsAAR0AvFLQHiC4KFVA3AsR
AAAejArQkCBAMSAMQFUA3AsRAAAYjArQiiDgLRAQPpYA3AsRAAAYKkSAoHA4J0AwIDUA3AsRAAAa
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8w==

--===============BOUNDARY==--
