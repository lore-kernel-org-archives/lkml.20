Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71644781D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790335335; cv=none; b=AEU/dF2ruIbGFw166BggVJpHxygTbEVK9zTPy1BElw/JQfni5D0DZB9RvwjGNIc6r68cS3WlFU7A/D/llB+ZVdOztURJJMf0sQYvUJExDpYysOdDcPXbX3j5XmCEMf3Xg7YjuQQw9/iV+Fgccop+p+DI3P5EAasggwV8/WPF/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790335335; c=relaxed/simple;
	bh=S/O5SVTCTUiSZPQyBDxVAe8MBIe69BJq3vJYrBDoK5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJFyush1qmKi7MaGuWPdPOIKhkzJqMFu+/b8USHFIIvGDbDlPT+3/T6MjwO0wbS7rE46FQlXKcURLSqPZx5PIoOID7IN10/7vRh36P7GS+7vQ4iuOs1R0iRl/wqTq/keumYlOP+CQzvTgVmVKclIpq31JLOQo23V2FlU/ZUqspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xbp9L0QZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xbp9L0QZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so2608305ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790335334; x=1790940134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU7aE2uFm4Gtxe7PSFefKmykiXC0/W/FmIxLo+XdYIE=;
        b=Xbp9L0QZ8uDYe9E3zTTgtYsix111Un1Sozk0CKaVasFHtR/UuTa1jR9vxO+/alJww2
         ndx6sPz6OFq8oKXZpWTQQZTiNzQ/9ANqo9uyE5SUJBNv6hke9YC+JOeKQLd8ZIDNyDFv
         CUskcxjGq3etuG/7F2Os9viJOdVaqzqAtJpdllmXQlftCX0afhvxB62w5qivNmvrbfSV
         q98I6+nRA9OS+kyL3/xcLeUrFiasf1l0KeOoKsfwpowpAB/BlMVksEmpClStaCis9Flt
         SdpxmFklCgQ75JgJkjrFtrKv8+dQVqI6gvrCrxp7zfaad8bCKlgoFBrFe88tRk3YIV6+
         FCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790335334; x=1790940134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HU7aE2uFm4Gtxe7PSFefKmykiXC0/W/FmIxLo+XdYIE=;
        b=po2EO2wmRmKth9x7JoRJtqKQw29LNIz80nN5HdhnRz3IxbARSSGE+/xMBnwxd3eS6q
         Zo7g0VDrB30X71vlO9ZgKCiJGXMKYKRVVGW5byQGWKPWD2R4/lBsNgBchNoexxXGancx
         ukMhfz2TckpTb/dRUlvqIugDfhCKfB30np/saMttYdRNPEyYIv9Jr6zv/JVsG9C+1dHp
         2IIQv98xb+FGJ8KYNjdraZhhsXtihB7e3t7c5LeT+74Z8Ej7dbosViNoM0NM3O2WPYzu
         CpELomaGPbtqv7hpBjeScK5pr+0cTR4Zc4mo9dMLPdKneE4mAHIOvKac0MYFjrAWj72D
         lLww==
X-Forwarded-Encrypted: i=1; AKwUvBxjT8EBToNp2SNJWSDyrCZp5qLRosToPAPF9lX6hxjVcRyFwmtYIlX4P9RO19RFt6Ya2fqQe4B20egyM8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nRdP+0wSa9/QV4jbzMTA2jFyeXqDY5qUTQ3Q0VlbTlxCG8010Q
	uS1DrLy4huTEYmsCLsYQEgwg71053gC7CndPpjonG3ujDSItJA0rcyHl
X-Gm-Gg: AYBFou2exZqHXCjodu3iX+qX/KZaNPNm5UedyoqJO5jheRz4hGUBn4brdKzHX8zKPXE
	gZOBM1ZzzKpjzIP/xzebqV87ZDZtvEwmuVFIgPGRA9YHqTxDFVre1ueHxxz55Zo/A58s+BgphAm
	6epXRcmzhWUXX3/KgXO/n0+O6n8vPTxU1E7Bvv2Pz6zau6G5/uvGLJmFJ/zzKCivFSa6dHOnddG
	B7TZPvmL/1livr0LZTn6boIIdCGgMWSfETQngCI71LNrb4veVcXYMfJzYdQGN8dMrAz/TFixAj6
	pBmq5Me6FxMhkE1e8CVmWS5GG3jt42v5nPYp+oe31nnlcufxrrhurLUKhNJMhiVYRocsTsY+sEs
	sAq01LwtNnjGBi90MZ8ZajdPeRGLDybjef9meynKEoiCS+0LRrrNI/eMSM577sjj35i3aTIqv0J
	BnPUMQfqNqgUcwbKTgBh4lAbpVV6MQuJ/A28KyIi7aVzbVmmzazPxLv0Y4iRjwPVtjqdQNIMtKb
	K8E2+NTcelxDux10j0qlBCfip8LpyIxsm1K179pLjhNae75CxwHAtyOBSt5HJZkpqAVy9qaCDCv
	jolDpUJ+fsZS4TBhoz7oqIIhY7R3nplMMF5CBI/Ctjz6RoAr2Y8M+RKlmFk=
X-Received: by 2002:a17:903:984:b0:2dd:ad73:c980 with SMTP id d9443c01a7336-2df7dc4086bmr46620395ad.24.1790335333493;
        Fri, 25 Sep 2026 04:22:13 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc593sm8476075ad.6.2026.09.25.04.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:22:13 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: jack@suse.cz
Cc: benquike@gmail.com,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isofs: reject short directory records in isofs_read_level3_size()
Date: Fri, 25 Sep 2026 19:22:09 +0800
Message-ID: <20260925112209.911126-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cmlro2xzle2aa7ebflvxhbcv74mea7p6qvxhin6egpdvyzyuxh@s45tpgxdal3n>
References: <20260919222553.3792320-1-benquike@gmail.com> <20260923175215.1577791-1-matthias.goergens@gmail.com> <w3rnunloyshklgq4ocr4jsullzhaey6u7odstfoyhd4usbfppo@m33jyem5jgrf> <20260924151356.3287733-1-matthias.goergens@gmail.com> <20260925043804.2091174-1-matthias.goergens@gmail.com> <cmlro2xzle2aa7ebflvxhbcv74mea7p6qvxhin6egpdvyzyuxh@s45tpgxdal3n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Honza,

On Fri 25-09-26 11:28:18, Jan Kara wrote:
> OK, thanks for checking! BTW how did you do the check. Have you've downloaded
> all the images?

Gotta use that 10 Gbps fibre-to-the-home broadband for something!  But
no, I used a script: archive.org serves range requests, so it fetched
only the volume descriptors, path tables and directory extents of each
image, about half a megabyte per disc, and parsed those.  I'm happy to
share the script and the list of images.

> So yes, just keep the code skipping empty blocks and I'd just limit
> the number of sections + empty blocks to 100.

Will do, unless Hui would like to take it.

Thanks,
Matthias
