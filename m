Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626851;
	b=lOecD8TB2qNJgXSs6EbatxO5spOWhYGRBaY6g9As2sGAVM3TAjxVm21Eegk9BEK/EY/j
	 0u51QPwyQdSQHGrpkLg1c6LTBSINMte8hb++WAUsL3erk3jhp39EDmuR64pnfHIBf9NKN
	 bErvblfQw3WS65HPPkgpUA/RrABP+Bt/CBEg9RtKygjKXeInXKNK5Yz85UkPJ6QgSZ+8U
	 xBguiqGpLkJAH1bg5nkYAfEUk1gw1nSyzhRKADBF/pFX23+cEhKBQoTD9qFJfghWutq6j
	 ZRijO3vgCaFLKTIGyw3rCKhK3rDDmlIZEPPlc8N2f/TwcXlWVuh3pWyWE0nxFIcYQZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=EEkPJ5sYCs2riG84XpmGHlS11U398nauVojefjsmFUk=;
	b=J1fgT6zIBSlUHgMwotwAfhxVupVtM/sx0/4oyyY8+oXJUF8F6EqAcs/Gr9FnIasDRKiI
	 icM7WN6iqANzEshRE4ze5EIiqlVx3XAAukSUCcyyDjRQGpwfsVza+FLrJlwHZJy3VQasw
	 jUWXFS5MqmFGc30DranJStkAWRdsYPSEKXsbui2ArlJOxW+UviuO+67iMw3MIw4oCL/jV
	 SStyIpZNq5UfSzaf370sXFwbpzEGC/j9ie66leUvYzKlHr/JUB9UC05q+JbdfY6ba55kh
	 XHzyAWnY5pIN3Uy6SGAH6N10ijz91FiRE9YMbB+VxHMCYdAgzxsxQM+upM2GahS7LRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gApoeV5F;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF960A3811
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DF960A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gApoeV5F
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19897735e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626849; x=1794231649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEkPJ5sYCs2riG84XpmGHlS11U398nauVojefjsmFUk=;
        b=gApoeV5FaQOL3LZ3kov1v98gEBTfqYxsHtINMIBtfaCPB69384rmGi1tcoJtqBYge+
         X4LYpA4fBK14PhYkncgTat/TqdS3w2Vpa3kZwMzzCCMtQfL9agaiu7Xsm5eVP9WDnb93
         h594C2VTz4y5cJQKIXOxZIa6ffjwl+1kBrWEl+vjfZG2VsGQvzU21sp00MEk6SVvt+/W
         gDQr9k5Hy7qsyPr/y7obkzVawCrYOxdM8Lc5NyGT71MoiDJBX37GXenZ1SWovH4S5ctG
         JGkxnB5QQMkFdMwv6X9vLnP09IxBBaLosDBJKy3rizHT0kVlzULTDXROyzLHoX3HVBXd
         AihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626849; x=1794231649;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEkPJ5sYCs2riG84XpmGHlS11U398nauVojefjsmFUk=;
        b=qaZoxJUUVCiKmoly6ffNOLxq2wXjw7x5JfoBgz9yvYAjhITnfPUQxUdHlLUuB1UYXl
         5D6/zqre1pgvUFUYVSNMr8L4Gw2ryoUpFRqvD1HsewwUWcinKpbNSRUI0+r/PNsxiU2r
         i9mwqjorEVbWR1K1qDzqsR2tVmkGMSpfhPJxwHM2u0yiPhWKlCi664f0jcSsP+nulcNs
         oYAFfXSvQo8SFNkHyivjbOYVdIuxJHPAoNeuf/7XMEEBMTzPK7aL8oPbINAgykTDWuaI
         Jg823bhUHFzA+Zpp8VcUNqcUzIhQRSVAoLwl1tc3QyMJtGuFpNoaaoH1vT+mcpmC1rdI
         eXsw==
X-Forwarded-Encrypted: i=1; AKwUvBx/JEnp4p+9bvFR4sbhtx6/VPVQDIhPRiomXFqEn+eL7TjsdaBmfmeX8t3iD+oe/eZtXqX5CEB8RAll7eg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb6cII9mXl2Ppes03Kx+dJbGXQFGUb6aTMcMkWm2nCFCt7WJZx
	4OOEzq9O9wnbzKWuQug7jFe/IAEbxM2k03N3BCknDIiEOQcIErB0WAhTDD2WHhAEYhQ=
X-Gm-Gg: AYBFou0I0Ksb+f0YRxo9GFNMzLDr6DePVi8NYANgUEIKUh+UMmI7e+y4FOnErnj+S5p
	SL7f9PrLNs/7lcRqps0QQgkogALfZ3nTLLK/xJ8pSu36tb7Pl4itbHZLrFi4zrkBCAH1XTMOwPg
	riTuUSAAX+2DMAatTsYK+VMv0lBcuE82jWZVZkKmHEAYrCLtFWPXWbHLKVBDo2upKl2cpKcJjTC
	jeT2ttxJWhwbsOWS/8nKw6jUGZA58g8p/cpn6o/KNUFd1vzrO18UWVNuPxXlqyM3Q8yFlr+vYyL
	Sio9S1iw7IQmlQAuNYbBCE2t+EE6XhOdEzeZV8P68p7yVLvxk49b9K5dm9250USpxocJ3CCYQ4d
	A/xv5h3htbXNdowDBXbbM1sRrsT/zejiM1dhGbv3ok8dbYyMiaq3ec4uLgJ9Ml1ImeZys5yD8aZ
	AFj3lyqralPzKS/+oL+lnQq2HGL3DxWstVZc2rool4DEsQXxGziHqwOMiVdu03MAb/YftdG7MgN
	FcFUCPpXqQ1lUpDmKcg3jw1qRMl+Syxy/RujwvVWuLhF1ScJEoQ4RMeMnKhSxweo/f7ck0N1hwS
	Kaet5aJrcwrgjLNs5oDj+ntSPPF8cXfXD6jkxxa78Cwralyhng==
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr223771975e9.31.1793626849036;
        Mon, 02 Nov 2026 05:40:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dianders@chromium.org, jesszhan0024@gmail.com, 
 Hsieh Hung-En <hungen3108@gmail.com>
Cc: jagan@amarulasolutions.com, osama.abdelkader@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch
In-Reply-To: <20261102043215.990351-1-hungen3108@gmail.com>
References: <20261102043215.990351-1-hungen3108@gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel: Use mipi_dsi_*_multi() in feiyang
 and rm68200
Message-Id: <179362684683.3310106.2850734684775211382.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:46 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Mon, 02 Nov 2026 12:32:10 +0800, Hsieh Hung-En wrote:
> This series converts the Feiyang FY07024DI26A30-D and Raydium RM68200
> panel drivers to the MIPI DSI multi-context helpers, as suggested in
> Documentation/gpu/todo.rst.
> 
> The first two patches fix pre-existing prepare() error paths that leave
> regulators enabled on failure. The following two patches convert the
> DCS helpers and initialization sequences, with command failures
> propagated through the cleanup paths. The final patch normalizes the
> RM68200 hexadecimal literals.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/panel: feiyang-fy07024di26a30d: Fix prepare error cleanup
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/439e9dcfb3ba4980522cbb2c33eff5f9f321db64
[2/5] drm/panel: raydium-rm68200: Fix prepare error cleanup
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a1b23a5bc8567c16552e5e16cb6e9d59c54d262b
[3/5] drm/panel: feiyang-fy07024di26a30d: Use mipi_dsi_*_multi() functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6b84154cdc1a4ebc237b308640d2ecd67aa90cb6
[4/5] drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8e7ae312688b05836376d11420bcaa4893053e6
[5/5] drm/panel: raydium-rm68200: Use lowercase hex literals
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/57a2f4d7c90ba17a5bb84ce6741927e85896f413

-- 
Neil

