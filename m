Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A648665D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781690; cv=none; b=cJaSacp2VcBcdJ5CJe4rEvqG0F8FrCDdV30jPpsac8wk25L5XX1cwt5PS5ErviBFIbcP0IZETPtyWL8hfXP2whGXQWZEXI3Qj56B22GuuX8iFULK+h2VHgBHfaU9A1uU6ADI1uISO4KAROCTm8tz5CE9klFpIsw0N02f1jmdZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781690; c=relaxed/simple;
	bh=TGbMSRctaX5jhPDgo8TGCoW6GnjLtJVIm7W+RZnDfS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqiAhAgDDROLTAbMWDZY2DcpYcQu6R5tzQqrazGAEBbRxkTappaKLkamY/HvrRCNEsRNawpY1HNkc9oeIkwGgk5Mx0q5yFWQtYMhlBaSrp5EhHBl1tQHNcYDpFB7cPB7pFRJ3OynKeGykLhLrRjH4OORjjFQ3VkEBNEsbzdRjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn2hFIXa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn2hFIXa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d58efc7356so42889115ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781688; x=1789386488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p29WlTfWVrQn534ptbrDbkRoo4ro4TG7QUYzDzPDAF0=;
        b=qn2hFIXa8bvISMYq3rd6wsDe0EojK2Lx2mgFCLxv74iT+jNHd25JwSOe+aZMk0bab4
         qWygx3wHjagV8KSJdYeS9VD+ncO0ZE6LbXacHXnmpZJV0bJMIpOeLbXzUuGyyCqmEK9M
         lTWpd911ttElKEezzQ/cNa0ao8i2U6TeVJ5Mt81vBolA05SMZf+SwxIqWlDq2s8+zq9t
         JCMnMesR+Xxmo5L1hNWBPWKT8pUpMMGNHd/YY8gWHnjn62Drf0Wwr7Tz8T9vOsdnCtkP
         0E4ItbQRH5/XnRflpVd1PecmfZg33a00H4xCULc8R2eZG6PfAAwqYEdNc9D9OqXNmExU
         VJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781688; x=1789386488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p29WlTfWVrQn534ptbrDbkRoo4ro4TG7QUYzDzPDAF0=;
        b=kRsfCm3nEXCDixjhYXioYnTUcQHc6FEe1NHzWh7Z8x5bxqg+g8WeOQIgg+9lLWE4Gq
         STaNUActpIl5GUuxkFV/xLxKUMs9M8hHHzPdZMDHcSqSAYHxgk9CzHZ+HUxr5ljX6nW9
         C21JlaLmVWBGrwjCdDrKJpu8z0Ojps4x4xG4Tu3aQKtuzR3mWI8mx56vzWOxlyostje8
         Yj29taNFtvaae/gqWCzwbEFGYguxGhf6WoH//r1RHKZX7bjfvfq72nhvUgSOE47Ud0AL
         J2OvntxhbnpdgZb0bkdWMvVrNMCYx51yaOjBaNiNVR+cMrRdRIju849Gh7nm6Wh4o2Hs
         vw0Q==
X-Forwarded-Encrypted: i=1; AKwUvByI3BcPl3PV61B5/Kxl6cOeWz+WziaJ8X0fjvRfWpnO1W14nz6FVDW6gAumABSaTqrRX6yLKE9dbemd2D0=@vger.kernel.org
X-Gm-Message-State: AFuF++mOTEiouCQu5oHdj9v2/wSLWtM2yxEksmsl2v2yCHl7CAM9tQc4
	jSZ9b1rGaJIjh+IgJfACm7eeAaiwM5PIgwcXiYAmcRfljD36VfYPL5s5
X-Gm-Gg: AYBFou3dNcgB2in6R19CEUpeVX5fu6352ZenmqgZtvNfi26RaboOM4hvKKIVw+v9wMK
	XEbCxkAQP83cuk0DQq6R8gsLMsI4I09xWhhsMGuRpjyXNb7GU2Jhy16SFLVZCZXhv3hDOV2o3O7
	JKdrsSXcGp8fLL+V/CpC1WwBXavtbAhkm8VQ/0G2nYgpftq1oJ9WTh6nv0mR1+smATXf9CVYv18
	OLXv6jUT0f94MLKNm9BUbYyP6btKlyydv6K/6M9MTl1giRA1nXtRo07+cI7HP4oMz4JtWZ3+2RY
	5mYQcSIOO9pAiLw3h8+U4LKJOgHZEt5vp8f2L7lf9NL2Eunbq/XTn1ykRMwsOV9JSucXuZ5Zk2N
	DKKuQ3slABL3QpEqYebYS3GqfPM5HeaQz3mogy9wTw7bpMfNKgbtCgyGnDDZSkL7yP3i7HVZKQT
	dXcPQTNd6wcqQksH9RKpooW/K7nzYV/cgV3NZgpOGhEC+IqZfTicM92PYiSWB5fTQWtuSuJSbI9
	u5PDuMAl8Nzjjc=
X-Received: by 2002:a17:903:2ca:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2db12255f7bmr331441695ad.0.1788781688060;
        Mon, 07 Sep 2026 04:48:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm30526079eec.30.2026.09.07.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:48:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Daniel Vacek <neelx@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: reflow comments left awkward by the typo fixes
Date: Mon,  7 Sep 2026 17:18:02 +0530
Message-ID: <20260907114802.16143-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907114153.39900-1-hemanth.selam@gmail.com>
References: <20260907114153.39900-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.

You had already answered the question it tries to address:

  "Reformatting whole lines makes the typos harder to spot, so it's fine
   to leave it like that and reformat at commit time eventually."

I sent it after reading Daniel's comments but before reading your reply
to them, so I reflowed the two comments you had just said not to reflow.
Entirely my fault, and easily avoided if I had read the whole thread
first.  Sorry for the noise.

The typo fixes already in for-next are unaffected.
