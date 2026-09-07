Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059073F8ED8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762831; cv=none; b=mfTkr5dxiJf73Jmj1Q42eDS74R2nCocaT7bEs6D2tEozpEQlUbbfeH32jF5SeJRdKC9vSpCwBHHh9tyglnWOK/JSmwbBTPPnA6PS3x9esdc59DNYJekxpV7yWfd7HmfLESUcJ21WbXDnOI46U4yk38bii8MDGS1DcC0zzDxnVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762831; c=relaxed/simple;
	bh=BmYQPN10Q5Qej5Y2o5u95UhxGgPeZTLRfAYiB3F9Bdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hzdqkdh0HFfm6kE8phbJuqBtZ3Z4q71jacg0DAd/3w4QOsR6cJbS7R9giCnWps1fE9WiLYaWLtV+rQ92RZF/Pj3E7hQUeXrYr1bEd+XpFVu5UHlyAbMrbCzA03c2orM5yKsfutdblrmtd07xkeF/rvIFlO1wxMzLu5usXa0B9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLXENe+7; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLXENe+7"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1992317a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762829; x=1789367629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmYQPN10Q5Qej5Y2o5u95UhxGgPeZTLRfAYiB3F9Bdg=;
        b=WLXENe+79sa5y1Us40dM4RfGRsqSIBTcn9+tVyfNIiVQLdVdK/nFwd46JQemhtWMnY
         athu/vgaKh+B/RgnY1sjkx0bHT3eCk4AD6+GfdW9ZiLBARuCsG38SPj/mIOqLMTfdZo3
         o7vpEuUfRizO3awOSiHqa9M1hC0Lr7blGd2FN+OI3N4CgJUZfMvu4zUQg0TZqhNdg8ZV
         BfLsoGE42XL8gvm4lENexcdqPk7ilhOQVHIx+YsmhIFTd/El5h6Qu2u1KbMl/5R6rlDh
         srwZT7Ly60BE6qvUn9MHLdgstpfDxcvWgzBfbgiPhBWaedmIMkTkia+92GfQpRr6t+jz
         fEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762829; x=1789367629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmYQPN10Q5Qej5Y2o5u95UhxGgPeZTLRfAYiB3F9Bdg=;
        b=CNNNlyMPQj4ax89oBdeuHiTlQfy9ewkwHmasu10fUo05BiFDtx0jAkIQechn3LBjBc
         VlXLxxk790QTYszSrLeBZg4QVLZQubMu0/u8kIFHJZizsy0Il7/+K+hRMQSAkdaa8JZS
         SF54ebOaIM7QHJNcExT3kLs5kzl44aULh09HDzeNwdqQ09Rj+ca/neOVwAK8CaHYHzaY
         z3bzkA4p7UZStygVmrSggjn/M7b1rQTkMhITzbcrkl0Fs755wDYZw0RNCMHR7VyOSa1a
         k80IxZBvwsxslqgzzgEAcZlP79o/SWInJrbRR/WqUHWAviD5CrI7vKQyLCo9DSOMgkCo
         32Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwronn2e9q3JH23uFESl9XMCNn7KsMpjuQNG/y2shCz3Mzjook4tjuM8JBRqrrkP5Qx9vk1otTIoEkByyw=@vger.kernel.org
X-Gm-Message-State: AFuF++lnYdWAppu5gVzm58on+kojwKLqdEm82jJJv4U5dyF5G7PpnQDo
	1UWSUg6VimBZfa6yni1aaqAEexRhK8I/13E9RWATBoRVmB9lp5a2mXBe
X-Gm-Gg: AYBFou3Tne1C+5iRPmYyZv0J/7/oxqja58mF6NEZgw7wXdA/7V/5N9YU+UtqcXCFDM/
	hRTGmugrB1DT3m9c2xiojgqWWOlrLAsIcBc8nEt+fAtce25JJCCbYTZCxkGY9a9ISu9pQYEvQYD
	W1b+7ZAn9RWuWN6fDbJOipbddbiXkZdd2LF/s9c5CeDjN3Zwai5I8Z+vSb0VPiAumVaJTDanYAn
	o6O086ffEGMQbXGKSh1ZhWkGENdHJugh26sqVgsLAmkdkbYI1RB6PUUqkyTgfdqxRZ7wnyRvCji
	UfeLLitRO9fe781Kc70buC9Y9ftellIfUJv1fpe617k3xHLDgIGwriDXGd5iy4jnwwZpBUvk9Vc
	beJ3buuHJ4xtL18SQNLeFBCrtJDYypMx4VbL5GtV1AlZf73m7hKzyihRLkjvZPkj7DE19oSSWGY
	Kszx5GvkljhgUGilE6YbEgeTjyYdHrE+WvcE+lFojoq7V1RqBp5KcHEBU2dDUW56G0FcDsTUm3x
	BtvvhFd3mFNuL+GUrYzqXYcZq8=
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr30545447a91.15.1788762829170;
        Sun, 06 Sep 2026 23:33:49 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm25400204a91.17.2026.09.06.23.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 13/14] f2fs: allow large folio support to writeable files
Date: Mon,  7 Sep 2026 14:33:41 +0800
Message-ID: <20260907063342.2300274-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_ybFr8thjmy3ayzB0u+1f5vSFnR8km67J4bkOE7czSyYw@mail.gmail.com>
References: <CACOAw_ybFr8thjmy3ayzB0u+1f5vSFnR8km67J4bkOE7czSyYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 10:44:46 -0700, Daeho Jeong wrote:
> In F2FS, newly created files almost always start with inline_data
> (`FI_INLINE_DATA`).
> Because f2fs_has_inline_data() is true during f2fs_new_inode() / f2fs_iget(),
> mapping_set_large_folios is skipped.
> When the file later expands and is converted to regular blocks in
> f2fs_convert_inline_inode(),
> `f2fs_mapping_set_large_folio()` is NEVER called.
> As a result, almost NO newly created file will ever use Large Folios
> during its lifetime.
> Fix: Call `f2fs_mapping_set_large_folio(inode)` inside
> `f2fs_convert_inline_inode()` once
> inline data is converted. Also consider using the standard
> `mapping_set_large_folios(mapping)`
> helper instead of `mapping_set_folio_min_order(mapping, 0)`.

I'm concerned that calling mapping_set_large_folios() here would
violate the specification for enabling large folios on a file, because
we would be enabling large folios on an active inode. Please take a
look at the comment of mapping_set_large_folios() in
include/linux/pagemap.h.

Thanks,
Nanzhe
