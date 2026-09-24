Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7830F3B5854
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224305; cv=none; b=czx8hyGYIpHQMjTCbps/6aKJs0I6ErXElx+Qsx31z2sp9ls6HrFYBJ2OdSQGA2k400hbZnkelliRrJx2oCfDZaDqabiyon3mp6MPkzpJ7yZfKWlz2OM1dSWBCom9nxhevaObknsNNJWnI+pe5177vtjY3/vkHYWhTL1OsaRWvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224305; c=relaxed/simple;
	bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ig2DCuyGxoHntfSAM4dE8+Z8f9ZWapbtO8Ir+M93nb6zrO5dR+xIlbk+KQeB0QP14FLZbwUbDiGrpvWxcT1YCSicBKoBdevgoIwAAh0JaQXZ5cRvAhNxHXEyX7QLxjoY3WtZPHHvUJVfa65hgkywxTP9z0bMRSrDBgBMJWIZjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f07ABrTh; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f07ABrTh"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so949663a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224304; x=1790829104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=f07ABrThenmPAoZggDsncPQzi45hJXPN6tRdYyKQJeFi6jByNb0GtfRwE5VAoTC8P1
         CdTaKCmJkRKcxSfhJwYhoK23GbIPRaliVa5xNnsXntG3qyToLJ+QuxxkEaQim5J1ApN0
         HBnfU8L2iWy/b0DcejsRCU8Jrt16bKKjLXY2ILC+OQhey7AFNVgMsfRtkXJ2mnFVfkLT
         Fvb+JSbEKoojAFm5e+zOOpLp8++QpfCdec5p9G2x9JoKqiD5Pfv1JcPiObhpJSluFFyp
         g+omvjrJANnZJV2ouvsq0N/xRKEunvKH60BCFDPbJr7XU06kZCRCiRxfTQPdHNbOVb48
         uU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224304; x=1790829104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=d/wlzcIVPx8wWey2N51TSO3ajMNV3kZqgDXZCsOd1hjolysz3AOWlaFhJCHQWvTiik
         Qrdp4SHzohrMQYqQevN8RoytnLwRw5zQiZkhBCIvmRViviuLejPjmFhe3SfuY4nv+B5S
         DAmaUE6sDW+cyHg0UdjB74abMw4qpep6AfE8SV+mlSj16orUCbelyFA2fFwScCcgooXW
         11ouFkDK+1VilT0OQiVrlJwgcene6wtLrawunhNYseh8wRo/1F2pE3GqDgREONHQGWZG
         5sWJNzAnCT1NisUbwFAaaO1ajEklBSBWC18y/OWLwKIY8W4CBKckOPLvYSnw7MNDvUpX
         gk1g==
X-Forwarded-Encrypted: i=1; AKwUvByC8zfdNAJ5OYdm5V5Rb9ACJNJpCWX+a17siqrwOV3kAtKJqQGwETHARa0BuWJnYeBY2P593pF5nhCwju4=@vger.kernel.org
X-Gm-Message-State: AFuF++l2CVG8O7Sc/XhI7QaOal7wG8hKWXVRugjK7comb2qc0LTLuPeB
	kJlFIU7sHu5Dpa0z+qE+BDTquSvuzxBYZNqla6sFgrjYMcqRzb1I5kq7
X-Gm-Gg: AYBFou0uhXAjjGBH2JOcsuxZB50uss86rPKaKwQu5jdvGtNFjPodS5K1XJld3lwT+Ky
	l1mFX1BBcIFjLzRa86FkRA0yFuvM4yhquekcWUgINy88OrKAvtA2YxaVv+SXqyUAH1iNvYmJBMk
	IwnfvMIemIQr2HnJa9oFExAr9B8XCo406VklLTJeLRX3IsN29ZqJe+wlpmNEzOggcFcPkfkOpqS
	gzot92GxpFNZAhSLhSVJfSHBGg8bCvPHLGBWBoY5ueCKUjYrvU6LLsO6Y74PlsID1Oq3RWKPvNf
	xxvxM9eUlpaWvMbn5WsQUZ5Eftbfoy9LPcTFVEy/3V370JLN2exzjwpYPRO5QW8Djkz0+RSgcrm
	rfWpA6UiriTU1sTUZiKXn8HAuwb2kTfWYAHJeTQQMp0yIp1Tw1K+SFPYo71Ih9viBtY0yNoDGIe
	f9YFhUWmpoQH3xWwS+2TBHEYhFdjk1oPjgtcDe9ZxluUXrYgbhtW/quCHqxB426td+Vb+AAH6Ru
	2Rly9jQlb8gE0wATfSA0+FxSXWCco3BCrPWREspRz+UIiRMase+K6al8ywqD9dj1ZzDvaLaUZgd
	qWH1hh8U9qz0CuvS8zG5lFyiwliY09Bk/s1HtYQTVBQQJFTazJYHaxFdMls=
X-Received: by 2002:a17:90b:1652:b0:3a0:9640:8043 with SMTP id 98e67ed59e1d1-3a098ccdd41mr1110650a91.15.1790224303753;
        Wed, 23 Sep 2026 21:31:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm2181929a91.17.2026.09.23.21.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/6] qnx6: release buffer_head on error in qnx6_block_map()
Date: Thu, 24 Sep 2026 12:31:39 +0800
Message-ID: <20260924043139.3894954-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-2-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-2-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to 1/6.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
