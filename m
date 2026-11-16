Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845345;
	b=YhrnfRzBoGrypExkQEzqVxo/6eK8cgaFrhVcj2vCxcaWniSEy4gb6RBg1dhXUka8Qz6w
	 3Wup0jsoG/NZ+06JY1K2Yd5pdWZyHnYJY1oLp9ycTf836c6IoldHGLLM1V6g2TrrKzkd8
	 t9k28Kyc2kPLLpmG+k8u1cIiATyZtiGm7F4fuhYN0gRjL4RAVXTODGyTzRLmbcpROjcJS
	 ndX+KongnAZ00SrwfH+ikExhrImwKjEW40gTvj+Qk2bfWljyOWMBuilD7blyaE3o9iqLL
	 Uh7Et9slwrIOsZws/IaU5GFgyzgy6t7pYw0uU/8g0iGhd2RoR0tnwlKsok+jco0LVpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=IwrAsU4GwQaSZZeL0oWsD8n6LzrKiwgHSLmwL3T2b1k20Kz7GTP5RDEdkuT9liBRoh1R
	 o6gBylIrkGiqK6fc4uwPM/kwpGMLFD4kjdNpZ69s5tOmVsvO0OYpRfF1PzRhgcH6P5vg9
	 lcF4P+gAknEZ7Gdyx0CtWKpZaFo6Zh6tI6T6E/wa7RBbjHvD+6a11zbvufvma23TOfWoj
	 6qRAoWjGpehauJ9ut8rUdswa2qOM8NEfLy1SBE7YZOeyGf8m2/YmeI3+LMGlk6qxVdW7a
	 oynw21asjuQ+5eq9ceqRulB8vqZFfQpa3XECTgNT74FPBppsglK5WdweZhTQVesUNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwtoFBne;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A35606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwtoFBne
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so4439428c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845344; x=1795450144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=qwtoFBne65YrYrGdFleBiK7uChpffIoyGXvdQ9QfKVRGWJEgDZnpqgY9ww7WW9fw5P
         GFggHf6cti43BuFQfNVpdSpwTcfFa8a+guGivVWHh+FQyLxK9rerYWK2m2ei7ZYAOHiV
         ZcL694AGT6dInEiyu8Tkr4HhCHtm7xKVnHLiLRrh6jquGaoVU097nG1HY/b8KtQEs5iN
         xzauO6eaqv8uWnhhefa5T9CClkkxjWX0hMW5z52p/YvQ8mQe1al1zI1QoAHN9W/0uluJ
         XaGoOXmaT56kV1EDRgIgoMyeljuCxHM9p7oUplY3pp1wNL13YUvl8rLxGZRW+YENtPt7
         n/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845344; x=1795450144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=1Uubc0DgAfBnFKBTD1DzvvUeAY81vrWiaSEB3lll5kJH50pZ4oLO9NoQ1xinkgK58M
         YhgXtcg/e5PkjPusXLnlb4SbxNJ67OQwKYweY4Qo82RdTU2Td7HLIBADvRFeXcTcWhhA
         DFqT4J9um03qN9m/Afq7JtQ36K4WsXYKKc3EyU2xPe5VVkwpfnd0J8y1bBXttcT50uSR
         T07ySrRja0XaEomQzGUFk3udDF0rbLXW7Rk7xOuUPxvMRwkPkrrt8YnpPeAGeRnbIL5R
         BeGnA+drWqlAnjzkaYv6BxDjMxCv/u9m5CQ1C5bPr7rdi4Qh9mL7RFPCRmE0Io5WOBl4
         3+Ow==
X-Forwarded-Encrypted: i=1; AL+hErHoKTtM1tWCAg1KfU5DoarKRVixsoHiLK4+7dy/pE7Ndm+Xo7FSsar37jjT0f4y4FmDDzsukvpGiTTexiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H+duLSZD1Jb6ofZ2PjCQ4HuMnqmquQkCZMHxOM4SFCeL1Ev0I
	LyvrOu/OTDO09q5710JMBXbOGe3jxhLGwAebE5f5uHVVo9iHQCQc7HmfdGXYQiM6
X-Gm-Gg: AYBFou3eMaY87J7Q+vQQX79/NNUzxKxLUNiAkT9t+NzGxNYHPQsB65u9+IxgIN6TIG5
	2dhl//DNQgjsepIFQhwPHSN9Sm7ff52YED83MqYjDcxE2pGkTcaGJCEO9QhVZyqnySZd7DbBrER
	ZwDSrq2bSlo4Qm5BE+tny/0iE/vj4NppEO2/Bn3uvuN4gE7iZ8JMnD5kQLEcdgzgSr4Esfoir7Z
	2zi06oAPVmUFlxiPm8coheAr88FILM4vi7iTdLsHtxBL9ar3PW+CQrQg2rEmrO69CM/T3NnnVHk
	pb9xCpwsk0j+7LEO2TLYrKB/8o/0O2RgPkn3Toy5yZeaJbnfZh4KbHNHAeQ38me5CnbGYwxmseK
	9/4knQJicS21eEeBfNhrduVwnSunHmtABmdF9nORfO1qFJLQ1+Yflq+3PUIpzEMKH8FiqqoY/Bz
	AWnEu1cB9JqJRGOj1Dg/2wQQVFWpJbPdKjv6eJkaLcndoZ4p8Za9tfj39nOXGgYpznYlInhrEkn
	o6jtqtB08QYCg/EtgJORD3kl+JChDZUUfid03qYJh3WyeWHKx+GTsTTUyH3L5kY+rn4AEzGlI+8
	hMkBvDIwjF7s3aSgKsNw5Lh4FTyyRhQWx8u3bTYbaP1nOm4IyJVDE4l9kZ51vJKMfB6Cco5Q
X-Received: by 2002:a05:7022:3a03:b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1b50315d8e2mr12037774c88.45.1794845343916;
        Mon, 16 Nov 2026 08:09:03 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38536683c88.5.2026.11.16.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:09:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kbusch@kernel.org
Cc: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] nvmet: synchronize DH-CHAP secret removal
Date: Mon, 16 Nov 2026 16:08:40 +0000
Message-ID: <20261116160840.2616-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179484220961.249619.12113326051904353767.b4-ty@kernel.org>
References: <179484220961.249619.12113326051904353767.b4-ty@kernel.org>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
