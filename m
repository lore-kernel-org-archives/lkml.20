Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607547;
	b=SIOKCh66yTHdlMs7JZ8B1e1o26W6ST39rnK3UWwjrZsJFyJo+4JP+nwUTcNGFpyCg+Uj
	 Q2SS7ACioCCZKS2G28eQkX9ttfTinliReIHE4v2suN6x8ZqXiZj8SoHoKZAw72VUhQXIR
	 rlt8yCBv/+rZg0C87WCBxPGIPa6avmmwEq5ANTn0FI1puSyiAvSYIHxWoZl85AKs5EoVZ
	 8angsM2xAIChoU/KZoCFVbSVcfFFxvtong8B7rJ41n1V2xKX/dlfX69XjUtANWhE3CSlg
	 MB4pXc9fl29+Ns8d5VyUPBjIeN+b4+MSBRlMolLO47Yw6DYj2E7MJ2J3JtVYYqshGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
	b=B8K7YUHQKMOS1LM1arwCJ/NHz0qFuMyGKFhkerKhY4fXOvlyD9UvPVEWFZMVG9zLLtrA
	 bkZeLpYmo9kJEfC1pnBpcYyrOODcmZVEfq5uoL7kTLiKT3FJCju9Gj/XjUS1nAjs6ZE5k
	 hd6y+u/edTq1aOCT2u2RwTfas4voTkjqyXaeW4F33ft1qml8iu9VcHJPyM438y+V4GOHU
	 7aMsTtjzlmzqQGF8ryF7hn7xfWbWHhx/QJq07t+ZRREHnnTzDYHzPcQPBj5y0hbJshKZZ
	 UOXucIx+uCKe8+lzS5Hux/V0Bfaic7P2DCU2QzEniokiCoS3KVnoCMaxTaRRF9OJjZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ee/Xv4Ww";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703FA606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee/Xv4Ww
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4922523d1afso715551f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607546; x=1795212346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
        b=Ee/Xv4WwOW2MVfLKhKdapsxwBE6D3haIpCxiQ0Eys9YO+HPqJqP8M20lfxyB+GjOt0
         +S41TaaFeW0NWD1fu3lfpImHFCgVkvrJKv1w6mNk/tn8fAwosew8ngGZyK8gA2DTzucR
         F9ccsLgNk7wWM6+K5K8WPADtv2mwtqthtUUCTTHAx6tAClz4SO+Iusd6D82qZxdr7BHu
         hpBcM1iICi2AqS66vp+65rD7sZHgIu0ukRSjoa6TbRbLSx2f33zdfIb0FOdptntUzsDW
         Zd8zUbiTIVsuQNGwmtIa/2L41QFKtuhnadTM8U/p+Zra7xSHc8zAogTHDbz8KdJVr9ln
         4MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607546; x=1795212346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RowVT2Xo1NxyJ1M7Sp9VuAoN0rAdPrex9DVd67tr20=;
        b=GuYG9caNDih3kzyYKt3+xWhwG5A6c2+f1dvWOvqBMecz+uxIm2PVHXyWA2FYDS0W8w
         nUL9Bv05RZo7is6sfk/JQSuQShc1ka9/R0nEK495fWnnxzlCdMooCbZ1dfm9aBTiMdeC
         KQRkcFpRbfZhHb7JpuZ1NizezSuXp9mmq/FT8sWw4uuCMAoZeDDMKWUVox4UGu2fENw2
         7s8VKbQgt1cUPv+9w6kogyo2FSOdFZuYQGy7eUxuZhbb4CifDTvdbfXjd1djPerFspZL
         ueeifNAc8OLyuVb7tMW80+ybux4n8yexYNyreAqO9KVRPQayDf9dFCws0EnmJeELiTp5
         4nQQ==
X-Forwarded-Encrypted: i=1; AL+hErHXi31Bu/JESdvLdcnHLgyuwykabl/FbgwNLgUgaKIalKWK99LxMZlxeJpHeO56igSJxazKYkgPcgcf39s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xe65CAitucVSRZKhj7AKHgpH/WqhEA5Ukzkcw/k/kqkhSUeRK
	A1yw3nabjSqKiawxau1O9da4jOYkr+bLjC+0mHE1zE/dhys3805RseLd
X-Gm-Gg: AYBFou2w1vGNjtB50geUIgcYvcp5u2Mx7TENRC0wVdSv2GS9iXIsxU4oia5KjiXRRsO
	6JLov+vgQbrWQMFPIl6XW9jqTtaHTtrTOmhz+O9PKjDfve333Xqu3NLDxG50wHlgs6QNR9NtD+2
	vIli+v3DDeEPGBvgUHZ4ysPgnbOEhC7DaPNOrTycH26KGGdCjCS9ZPoHojj4D/ED8wymx0+9Xx7
	RevjNVWkUpq3n3o8pjZQuiwBnmeJ9buZIim/blh/KLN2b4ozMrie2ABmimEEUxUy82cXIpomqqp
	Upb5QOa2/wunrNNjySltBWXYRlzJ6XyusjtxjCmS3vWvC4dg8rMFztueZEKF8Zu1W4J1fHTG109
	OVDMiouqVVNZ/5MMKgx6sevKaJF1SO4CzJ3ambz6nSciOlX7YxVYoAyKqrgikTdTi0iX/PL+Z6d
	raqj170zjCZLx3GkNwpaTAKas71qdzSi97tPBcOr6aDhS7jII9jsoe3dVNLdhYtH3qvgyxoe1V7
	hsL/MQTS7bi6HhPSMQrKg5/9eYUQtv0AdV2R8rlWnpQgyZcjIEwrP8irj1dTOknXN8JZFlXrYSM
	heEwaoYeBs3YTHyRCq1Z0gc5wBjOkLZoL0c=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr9022706f8f.4.1794607545676;
        Fri, 13 Nov 2026 14:05:45 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm7238049f8f.30.2026.11.13.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:44 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v10 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 13 Nov 2026 23:05:43 +0100
Message-ID: <20261113220543.826489-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <F9A94BCB-D3DD-4ACB-AEA5-118611FCBE08@linux.dev>
References: 
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

Hi Luka,

Thanks for the review.

> Maybe drop the op and say in the comment above that this path starts
> the countdown? Or is it kept on purpose?

It is not kept on purpose. The BSS_CHANGED_BEACON path starts every
countdown, so I will drop the op in v11 and say so in the comment.

Best regards,
Mehmet
