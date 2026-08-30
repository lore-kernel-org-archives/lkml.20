Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298023AFAE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788112294; cv=none; b=lZZzk6WZdl4uqgJ93qCU9wVmlgm7YhRQBaHs3tzEF68VPxOV2EweeADA/DYkf+KEJHZ4fRxTpungitIBwl28PTZJey8ZnixIkuXYiPSokncpo2LkqYtIiCUMc2nVRyXpwXV0Nnk7RlhbAGi7PQZHyvRGvCYHzlXWToHZwOcFHJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788112294; c=relaxed/simple;
	bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfPokenr5afIqU/uzHOGhaDeWX3TR60NOM6j0RMPPalohgNGHqvC7+ZURMknhHuyAfCiA0x+fUL7WSRrzWDD+thRKmzUJut65tcgKCslB16YfIL+hoq9WzQCvEBd6P0ZhCuRK9M6kK3g+Zid4UDFV+K2XuNhdLEl0HnN+JzOO/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGGUDNze; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGGUDNze"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2197185a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788112292; x=1788717092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
        b=rGGUDNzeWqIr++yoC+zL/BDiwAahFHtySac4XdDXfweXL4YptzloLBEz+v7IvkIM0G
         HKCrXZf+6Z4ippBovL0FqEN24yb232Aa9QBuVBqmf/o3pAVu0DlzuRVC4WcD/C77jX5E
         gDtL4/AcVYQlh4fLXgQ+i3+7uZ63i1TGM15S3yYoYtEvGx7zsWwX/xBei1EsSeSsAyMn
         HJ14APNXIl2SZa/Fx1XBbWYkHvdAy2TSKR6/oCpbBJoegH2GO/928bookvbe98pxoG32
         5TfAjwnMR4DrC52x6rY85KZymJaf1/YOVoy/ATWJYOFCyxeVH5eLXrUgbHuV7hGDmd0U
         KKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788112292; x=1788717092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
        b=Rqcut6rg0AoaenFkyJk9q9eEeaYRtYpXU0E4uopjegrM/DZpdxY6NE0D6RIb+rb+ci
         9dfclQC1dBLojoBhrgJI8vJXcPtf+qqwdNPCtncMTrd3qjD4zpvStpWfUkcnDnis2pp6
         LpmmVLpgAG1sdeKV/DSyCvyXDLtE87e9DsGHY2WwAVxTVy0hICbpGEJaPYhGGAPH2h1b
         kzy06rUGw9wY/vftPdvLVx/OcL6kkF3YsL/fQGMjkFUvEvPFuJ/SW2bUVtyukocBBTuI
         is+tTUxCOd2p21Z5FNnkTd/exSyB/XsU7Vwrg3SPgTnbXC0/JTSX1vkUPfcMmBWW128S
         anPA==
X-Forwarded-Encrypted: i=1; AKwUvBznSzHwP3NBggcjtlKMeJ9vEwX36xldWFls3Nq0FhFPRWaY9yVDN8E+RLez02J9J6lI7wBqJLqOAKG13y8=@vger.kernel.org
X-Gm-Message-State: AFuF++mBAcCivX4mraPgihnBw0CBstoCewV1+vT1jX0sL70FOgP0ZGAa
	AU/BOp0AvX5W8BiZGYaTpJ8CputwhCXJU1cnetgLcGnwei+LAc3RHG4h
X-Gm-Gg: AYBFou1cbhn4b/YSHYnpfwmeNw6+vpxdPXl2GsXtlpv/sDNX86xkANSwfBX9gA4MtrM
	Tb4QpqeMkhBVzLlfOBPn83h0dY1VPNI6BtjTsnI7BnfywS+bC8qbn/hbSS0ssaeDgNfhvRQu+U6
	Zf8szi8goe4PDnJ+YsRzMKxTbACmnnwhSxusDgbMZfph1Ccp3k6XyMks6w2fhgvMteqTFZ23sw/
	xcqdaOwpyYZcgtCK7jbbyqeDWJ5I2LUBBUgh2WO99B+N4iEMwe28QySjj9sX6x8/VZ0xHlKx2ra
	NUY52YC/A9m/IUMfDvPZj4saI7D7YfXomuMICw1SZlAUULn3cgyWojdSsEhnhRA/2g/uC/4QXBJ
	6R0OALi2pgTDoHcuttXy6uPtaPQ6Bo35LBXdXFmBQ2JI7xThGKvchItQsRRc8GZ/6M7WyyoxHUI
	pmqk0r9g4z9AJsSFlYjQMdWal7KOWqGV7SNbb8caDCSICj8MUVs4si8ptoB4Rfg4WnvcWi+aFua
	w1UiScsJm7t3wX9g7Wo
X-Received: by 2002:a17:90b:5287:b0:398:9c07:8907 with SMTP id 98e67ed59e1d1-3989c0797c7mr20332628a91.24.1788112292515;
        Sun, 30 Aug 2026 10:51:32 -0700 (PDT)
Received: from localhost.localdomain ([2407:4d00:6c05:13e8:a91f:d3ab:5c4:f6ed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6d29de3sm3686145a91.2.2026.08.30.10.51.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 10:51:32 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: song@kernel.org
Cc: pmladek@suse.com,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] livepatch: Reject livepatches with aliased old_func
Date: Mon, 31 Aug 2026 01:51:28 +0800
Message-ID: <20260830175128.58926-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPhsuW70RpkZ1ciioSjt6qkQePWyeic_L+98d0h-Ao3ze-TmkA@mail.gmail.com>
References: <CAPhsuW70RpkZ1ciioSjt6qkQePWyeic_L+98d0h-Ao3ze-TmkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026 at 9:17 AM Song Liu <song@kernel.org> wrote:
>
> Acked-by: Song Liu <song@kernel.org>
>
> Can we add a selftest for this case?

Sure, I'll add a selftest for this. I'll send a follow-up patch
within a week that exercises patching two aliased symbols from the
same livepatch object and confirms it's rejected with -EINVAL.

Thanks,
Harry
