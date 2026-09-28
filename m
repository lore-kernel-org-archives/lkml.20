Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA375013DE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632503; cv=none; b=WNaYRFpjscHjHRjVHKJ7Uez8v3ulhV0JqDju/K4z18YWR/kcC8zVOkaIv94arWT5FtarDTTe7Iv+xf9JZzHnioMm+N9ugq0zuN1RyeGjGM9DTGwp0kfJzBeNnig/IKlAab7ItyS42vPWHKPIAlOhyRc2tJ0u7ndLAtXSsW+buv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632503; c=relaxed/simple;
	bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7lul0Rc2OLHJB7Hti/1bquq/ZUK3dP5TA64OYbqWN0A/BKsvnW5mm61nlX79j35HvznoHb3k6HQpZDZGtQvYedwCpQq4MRScB+O8NikC0dsOmqT9Jyiu3jaAePZLvmGgwuklK0ImsO+7ABZ89zXTtvEZ13TGA2qTFF54tgX628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=DvUaaZIL; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="DvUaaZIL"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d73f71a49bso1022575eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790632497; x=1791237297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
        b=DvUaaZILADnwMVKEUX0PgmuY8FmMMzWHVR7VQffs6C2jOX1gdv01eYO8hjq5bmj1I0
         YhrZ7JUU24ePSO4mg0Zut1ABJ7tcrd0DIPH/Kfwlc3VCDRdcJjM+FDpI9m7j/n/H0v/N
         EcYCH7zpN1uaiXnJalWp6Jj4doSd/8uLPGXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632497; x=1791237297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
        b=LQXNlqhAFFxejPiuXBG0iDFs0INYHZ9mzfphjPCVcD0kf9R+qpUjBt/v8ZcSOUYeTY
         +DqvcaTDRCtQ0VPnk1vcmb0LgvJicghnLhZMDAEkyM+z1LUUWL8UfOW2CAmA0sxi4o2U
         r+H4KrTp37Qjf1EQheqH3+7BunifK2LlwGJ7+6uB9fMu5YLHP274qISXP1pZ3U0GpvwW
         oIPBoMxFczlNuk2xYTIceG82ckYRGAwsqe97kDQ/KNXmGJ1dgg70aLhsMYp6+iKzdCEk
         B9xXKelHAJwWpsLecBriZx8MYQ7m9asAuep4dfYDPy0hWx2ojlEzVUToPs/a7CuoVKP9
         LIWw==
X-Forwarded-Encrypted: i=1; AKwUvBxLQJIQ5CeUAUGxMh1xqJCZUK/VtZoBzdxE6Zf7WuMrdNzjPXb4MlUxLqMlswHgWjjfJ29TLdy2TNIj/pM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLl+X4cHGKYa76apnqM/xJRRbl0ucY3NPMveny5Q3TsBkTAnoU
	mGGkiqHwxe+0TBhEXPquMLRzv2HC5v/GBDDN73GEkYyX2jT8goOntZzOwa5NsWTVpgA=
X-Gm-Gg: AYBFou2CK8un0N/gfGINwM/Kv6aopXvAv8YfenbVKGOHE55juKmigna1eX41CLeX34K
	kQhDCeIA65M8j6CTuwPb0SgF3bPunQBXKt9ZQOn7BPfRYrLBdqVNyvNaoldyDlL9Ej037Lam0A3
	dhJgCx4SD2S3+i+SZfJXrM85lMGtT6msFM6oL5UE6qObFduRCtO4l1GVRLjK4lVDr9yQi5MmG8x
	7NqwpkeBPPP177O0CtskVflA6MGG2IcAm5EicljdVqaaOf2x9aHFIcCnrgeNW83hMjG8enbdum0
	1i3Nlp2rtoUSaLXP+YNchcLa5hcm6pP91HVUJsgT0+z+yYfYjgbptSdXv3qvr+8C1GZ/XRn5J4w
	grltBPg7IxnbCC/20zezMCp35ilMlY2LwfA/i62G62MxnTxbLLQpILuOc2/XZZuz+3nhhkZviww
	gTO8Kn45TLJBUPTf1VceYKMaY3wpau2r8LxNCvs8B3mRu6f9lw+AABs700qomGjSPimfnuXU/fu
	2EnXEna8YEu0zbVRJ4ztw+TfC4IoeVviNpmymRNZp1q4eAP+/VOXKzu1ndQTwCu+/FJ4MOP6kUd
	uiY=
X-Received: by 2002:a05:6820:1798:b0:6d8:3caa:a468 with SMTP id 006d021491bc7-6d83cd96f72mr4817511eaf.77.1790632496519;
        Mon, 28 Sep 2026 14:54:56 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d57ef36b0sm2605923a34.6.2026.09.28.14.54.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 14:54:56 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] tcp: preserve RACK tracking across partial undo
Date: Mon, 28 Sep 2026 14:53:04 -0700
Message-ID: <20260928215440.25109-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926002520.42955-4-nramaswamy@openai.com>
References: <20260926002520.42955-4-nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Adding the maintainers/lists I missed on the original CC. Sorry for the
omission. The cover letter and both patches are available here:

https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/T/
