Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C055111B6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061831; cv=none; b=ozbUre1phbAhrllz5jGWhQypAvE9Q87RCt/v+lHudCtoeRaasZwc1rRdCDQqfyzCbLmzI0CcD8fBuHuzs1ezLGNYG/N9xmMrOJDYCLcz9G176FKSbDXraJ14GZX3E+ZvOQq/pTgPdrUhhQFJYpmCWVDkFb7RsgU37cflk2RyXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061831; c=relaxed/simple;
	bh=MBUpev545pUllQcG2IZp3mwNOH0au3/ydTIJGthnA88=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YuzlZ8WUtlOVAEm2ojqkheSF37erfuTzzB5xkiWyV2UJhddBNWNYvxUR0YQgkHC1QMn3cPJKDO2HcCBg9xkFMN2GYcTAKJyD/MvJ/hw0iS19sevEOQcx57D+wllhikUOQFUekFsbdRpvo+5iyCdVcLYrG7FSS+7Ny5q04wAzJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BoNmfuf0; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BoNmfuf0"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db050d469fso18299835ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789061823; x=1789666623; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ixa+0zFsulp4+PuCSm+LSQ3ZbsxbILCT0CSEEhgLf5Q=;
        b=BoNmfuf00F0LLUG1A9CVb1eGw6zhYIHSwgjhbGc0TJI5Z3/0Z90pAUI3kuqxxGyOwR
         7CAXeWaloHH7gMO1QVZW2lM44Lct4PgMprcudY9KEHAZJdFWD/uxa1wXomhZCK5ZD0Ub
         blkhjEMDGeANjLcaqZNxc3hRg6ruJSGzMwIvejmjgW+cS6pb/VDp0MvC2Qz+tCaNfXXh
         KvN5rQ/VZ1qSGSwjp4teegmAyucJH7wNhKxlebMX8h8qUdtdb7braSKDqa2gdogS7KM8
         yQ8xigNRhxXlqsU/h9vCeUHcGGlQgwUUCos8WM4zfYMihi2RZRvAc9aB49IwIxkC29/s
         9hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789061823; x=1789666623;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ixa+0zFsulp4+PuCSm+LSQ3ZbsxbILCT0CSEEhgLf5Q=;
        b=DmrTSHhKcJZ3BJaswcrq/nK0PQym/FOATMFECce6j9nrlzDWoZSQhdeEWSflY6tMzN
         SChQWYTDUiJ3mJq6tngUc50miS6xMp5zGwUGjaXrdTuQYXMH9NyclIsDE/pjeauo+LrX
         iKn41w0Pkd4fMkXCdJx+u9CLXyQuSJJM9zWmribdSM/bhngnHPiYI5vQLhThTCOwCuF/
         evkeKDcqY/Eqvo9kM5AOtsz49HFuqg43WEbeHqb18gy0vy7Wh/uki4ki1jDD5mEMul21
         IFkgzcTyY2S8gH1pFv2bGzxpgjeemhga0qR920SDnAOjkpS099w2pKpLDJVAIPC8WC4/
         qMnA==
X-Forwarded-Encrypted: i=1; AKwUvByIeSdk881VuPoJKkVd9tUjRFsAMODpUW12p3DFjPYmJHcTf4D2NGJlt3OEfj95pEOPoiHWKXYI4F+DkUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mjH1IA/W6qM6CtG4hTY2wwr14hfqhplOqLAjx9iSXq/4aFjtet
	yVcKZF7F/TwWFKocF76Ui4M4BdO6jVUOfVY+zVZ8X70rsYjgQki7V2Hw7FRrX9KoIO0m2X2EJTF
	sAXoee9Na3o3LMQ==
X-Received: from pltt1.prod.google.com ([2002:a17:902:d141:b0:2db:1aef:28b4])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:38cc:b0:2db:3734:cfa4 with SMTP id d9443c01a7336-2dd0e8a0ef6mr59319305ad.5.1789061822647;
 Thu, 10 Sep 2026 10:37:02 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:36:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260910173659.1945246-1-skhawaja@google.com>
Subject: [PATCH v2 0/1] liveupdate: Add documentation for file dependencies
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

I sent out v3 of liveupdate_get_file_incoming() and
liveupdate_get_token_outgoing() series to add documentation for
dependencies.

https://lore.kernel.org/all/20260820191854.1642931-1-skhawaja@google.com/

But since v2 of that series is already merged into kho/next, I am
sending the documentation as a separate patch.

Changelog:

v2:
 - Rebased on liveupdate next branch.
 - Fixed documentation.

Samiullah Khawaja (1):
  liveupdate: luo_file: Add documentation for dependencies

 kernel/liveupdate/luo_file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: 945d61765894dda2f0344de50cb1ade2e51b66fd
-- 
2.55.0.1032.g73a4cd73de-goog

