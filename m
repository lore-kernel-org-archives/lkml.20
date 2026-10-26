Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000480;
	b=XuOpcOWB55gGRCPZWAOeWZZ9FuPGJqnZP6SA8X4pV8l8A/Engtj441uvM8s/T8XI3iKP
	 buz+Xmp/aFTQwyWfYx8gxGf2Zgg9yw/dxMUwnE4duW8/GgpziQIBLTUQ5P+Mp6SnU3cwF
	 J6pxYCJCtHQ3AoRcGv3xn+XbxIgRC2sFqjDZSZexpVzr7iizchvupD6yQxiHQRWQpMHK3
	 5gjNx4w71wubbaYamWrn3vlnkChXDRq8DrTHkPkDf5yU/WKQ8gJWgOPLu1N+DIWSOO795
	 28OIGJ1PYb0iH8oGrf6VS8FWehIjEr8w1vw+/C3SVzraT2hQdoTBauaWUh65FypQzGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h88WcqDPqZBUi5FkapMuvsXDFtP2x22CkYcuFL5W6bs=;
	b=yx5cVbxfhMwXOWPmYs/uunVc8tFMRRO0i9LL/GQmdxaW9BjUGN4OpWzN62Vz0kwgEXSj
	 IK2LEQgSayEDQs7x85qXv0OavgtkglE8XhCHtSwXRzZ/XjF2mb+Yjoag98vfLWXAJD+NN
	 +owjvItedQn3Is9oj3SGXe8xW+eJi+cHdn4pW3ApM1FROcWhiqazPH4H56tlp2OBeK/h3
	 xGOPLvmq2uFYmgfXOdpmIeftjiZrmQM5zdhnWX0DbkIR8vd6jVmzD5W1i18DlZbLg4YGW
	 QhsKKY1lARkvS8+QCtA7NPqgpvNIRFnsw7hhUZqe+2t9T69HxFSfab6ShQ9k5YLbEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="gR/yyMBW";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gR/yyMBW
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso31860551fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000479; x=1793605279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h88WcqDPqZBUi5FkapMuvsXDFtP2x22CkYcuFL5W6bs=;
        b=gR/yyMBW5AUuxS6qkyqh0R4/j79eYqoqClI3YRdXwRpG+65rleop0jrq8xJEeeS5W+
         lQkFir5FIzXSx0/AN/f/2yi6idLs3s9Ofgvv6GV7q38x+JrxPs7nyayvzu1JVB59SC17
         hqpoOIuoJsdJ/u8ovnLOrt6hZpfVeh2Mzam4OnJl0x886tahoi9JyDltIlA6JpwFpHjU
         LXDN7Br31tyVg42TYKpZjwHBSiTdATqtVQcPHS7+uRwmvbVAHdH7MN2A+JeiZxQmndRR
         sCdBGHputXhU3h+A99yRb3rleQRkGoEMuAHvUhI9Qwp+dQHQnp0PHHIyMoQUHGA9zbD5
         Nkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000479; x=1793605279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h88WcqDPqZBUi5FkapMuvsXDFtP2x22CkYcuFL5W6bs=;
        b=G3Rkwe7RWEU0Lv5EqnDxeXEQ7ZC4DiQ0ZnjXfQ2woEyaRwhntaxEJ6ibTjiGIk1Sgx
         UxoTvw40Ijp2j166WWNK5qRT02eQCQ6clgmIY8J9jaAxDpwhwdenBsl1Segjr+slPUz1
         x9Vlbyx1WNweAfDdRwnZiuCTyhVeYpbPCWEkkIANFkG0O4PVMIIszg/Hc+zj9TSwMy+T
         xPMxM+e7z86NNUdP4VdrHQ9EZeUdFc1LqEWZYWf2goQ3e67sYblc1n3G9DEklGAu1LII
         C/t54XpwDgsJt/aXgP8YH8p50ScPRk/YpHCgRcu9ojHMtx5L+YUByvY8lMzQU5cl2eAw
         E5EA==
X-Forwarded-Encrypted: i=1; AKwUvByIBXLQTdGTG+Q/cu+6J7VSg/6t2IkqtdvwYFFB3l3poHK/B3L8Srl7Tr2HuZXzJGGIF3D5olzMhss1Kug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmbGYw6mGUEqYkGSqaAerjL0FMmad4qYfSn0BEXw8BF1r8Hu64
	KOZ6fEnJRHwFySesXrt+J5LQ9XOubkuUcvVDew4hRQgCJXPoYXA8pNUG
X-Gm-Gg: AYBFou1Cv3PBWEFsDaIqeX2+invpxDdjQZM1qxNFH44jVmDJ5hG1k2OkZgubCpXFCEy
	GTMP4EUu3szPAmKoSROmS11DDwdmAhT6wdfOfj0klEMgdRJ23w9HOoexAjqeenlg42f7AV3mo4H
	+9F3zFvZD+Z12MoYPPkJlIJmvh+VIzVJ4oQzvM2L942CYu97iWx9ExV8FAMU6lasU+LpR+JC/JL
	N/ltV/d596gNRrolxr8a482aV2fors4JvUD9rjI1YDsUp95SYLq+cTHGXgIilc83CS1HCo+uASz
	3tavG8t/t6RW42meaETjzZNHKKR8vR1mGfMnX9L0A0p3y8YnX7qvKqMmolTV4b/eUTWJ/+6y3Fb
	GktkwzvOG+dzlFwOM2UiF03x3Fr6Z0q9NGtLxMA1QQxBXD22eLN0RxPKqFXmQglQmv8FuP0IOys
	/Qk9PucVi3P37msSVyZu5DJTs9wWooFtJjA9ypNMIiNmjAF19B2kAAosGF05f1ju47a/T7TdcLR
	wxHC6gMLMyoTwFf8cRguVxN/40Qmcx6UgvDXkYCKGos1ZX8wR25Yt0OdcoD6hlM9jve5tlTxq1+
	EJU01nK4dK4zLQHOScWJ7hqirAZfDNJVSkGSUL6PNQewLua53M/WmQ==
X-Received: by 2002:a2e:a917:0:b0:3a9:8762:d77 with SMTP id 38308e7fff4ca-3ac6fcbf58bmr12890491fa.6.1793000478642;
        Mon, 26 Oct 2026 00:41:18 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a493b6sm15089911fa.37.2026.10.26.00.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:41:18 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Hung <alex.hung@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Jun Lei <Jun.Lei@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: set allow_freesync before validating a new stream
Date: Mon, 26 Oct 2026 12:41:13 +0500
Message-ID: <20261026074113.299632-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018221726.27259-1-mikhail.v.gavrilov@gmail.com>
References: <20261018221726.27259-1-mikhail.v.gavrilov@gmail.com>
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

Superseded by v2, rebased onto amd-staging-drm-next, where v1 no longer
applies, and with a Tested-by from a second user:

  https://lore.kernel.org/all/20261026073345.297491-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail
