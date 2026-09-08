Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947EB5540A6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904797; cv=pass; b=fmaPzrL022lWPuMXQ0PozopFCM/73OV3qEWzKEi/XhykTO9Awm6e+jyXQUxvyFl/iLiAxA9ijPypb3EXWsDNS6xRstns5DLwBLaEPbD9a2RHIt84vMpOdsZrxaHE68yqW2V9VynC+0gErEFHIANSPAOYqG03O1rGp7HlRCuwHCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904797; c=relaxed/simple;
	bh=ezKSQNkgkZsBEaDB0itB1ybfMlHc2DHjcxywuo/Bhew=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=h1dXu19vIfKOijm3vkSwJxZ6oaJbivgLXcjiDTEGWbaKaj83tyrbbU/rhDBmZWOvOZq6dW9O0lYhIVy1887+rhY4GB1jUhGVWDrcehS74IJatxrywSwV3SqR9G9Nsj5AHZA6IVyMQTFHaGAVdICweV6l8AomWzYplwCd+DEpJ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghTSv3Yb; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghTSv3Yb"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c80b099b4eso1327644e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788904794; cv=none;
        d=google.com; s=arc-20260327;
        b=hyHn4ch7fqQKT7gr7/VcKHcrU+XMcqQ1UQktYIVlUYR8sZr40NM4+aFeFFi0hUetpt
         +pxsGk3PesbJcpSsxOjWGmUol0qsVHYA5sgESXI9zRPvsf99ORf3VFV+M6f21Eg5TVwO
         3QwqhuUgcCSh+nrpXWYlbmVSTSiP6EuIVWs3wcTTcZCAkeHZb6z1KxoHxEdH0lkmUnLT
         jjACC2Nd4GbxThPRTIDFj94hM2HP1+gd0M+qFZjDdl3GECHyOouQRRfHNuY2AWJ8DrJV
         +mXl3ik+5FqiPKvGH8HOn5HKEJrS3GAQU0ODKVE8YU1tX+Alc6xGYhgBnmMYV/V22Eft
         w29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=W3okfpfF+ulwslFQA8mPfuKMUob9DrBiYFJHYdf7ib0=;
        fh=aXo/4kmAN5Tt0GH2RM99U0neAEIxn0KgpW4BpvgDcK0=;
        b=cO+dQp4jygwSGxRxWNteR6nBN3ZRtmDAr+TZe5i+DX1Tu7VWmRONNv8ZmFVM0Empqf
         3kQ32ghfP/ZgRtQ4sNBgNufk1AxFbbntNKYaLHUqC1pVhuTF9eUPI+p4UUGR2Kr+rfX1
         yUhc3ERo4qZ+xPznDvFlZ31wWIHy1wikB4o9JWEeFPEwHdPeYSusvg9B7PnwMjtxqC31
         uFCsR+taq1bCZfBRA7KwkcZNoo5vPN2K/yZBY3Div6vahYyVnpj9+QTFi+D/sBffvVwR
         KGoP4FBbYJvc2s9SxaD6rWjK6G5t0rhjvfx2G6V3sZ2ndqY/gOWxMXabLZWTGZGOrjQk
         LAjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788904794; x=1789509594; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W3okfpfF+ulwslFQA8mPfuKMUob9DrBiYFJHYdf7ib0=;
        b=ghTSv3YbO0/p+7bIrHoMzYZJpg+oK0AlyH6RfaSRhy6sr94sP41f+o/UHIPqJGVn+i
         izG6b/Oq5dnAjc5BxB9WKMfq5kRxxDKRvsbjr+AlBsDnqhUJWGW0ExjhngW2CJsfMnMP
         my1uVIh1icmszdgRWrJsWwWrSl6gwgXDXTyGKlAyoah8kceHEg/oRtaN5LSwfhl3WAFP
         E44CPVJfV3qb7POkDQ0FPodV0d1XdAgij+yx0iXrOTrui/gECvM7r8gPI8xXl9a/Z5c0
         CbwpvKPHJJek/eLNMCnetIA27SeuSz4D03oUp3BKuj+SlROsLvtPj6lu9OwkPGtF/Z03
         8/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788904794; x=1789509594;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3okfpfF+ulwslFQA8mPfuKMUob9DrBiYFJHYdf7ib0=;
        b=P1mN51v5ePXOV9n25g+9bhL5FcGM4fTDfxUbz8L7zloNYYj20QvorAWFV50yZlDXVL
         2QHNcBDpbYS/AsYFSPlqgnGOpoDa9hoFGtue2O6YB6qKTN6jV5U6vum5/OCWf9iO14PC
         wfTzWufUlWqrccaOs/QE7cwL9Kn83/CZYP26XgyJmGYRZX2X2pbQeTOOgEsyenR0YbHD
         24StZEqEh2lGd53Gwpvsafx8Bnq6hcZfoweRSHh2I31wG2vhGnuf6Ox5d/c9ag38T///
         itDmv7XTUnCWu2rBfIYjjyW9YIdMTTjyqGjlEYgH5X8YX1d0jFjqCgEBXXeeDEbNYUuQ
         5S4w==
X-Gm-Message-State: AFuF++nlrAPvv1RKLFamb9vorWflyOwOus1GLCCRm8U9XvEC2sQEPUyQ
	VcV16Tbw/Db78kyr77chfKiOl+xDNHZvDSXOP5dWiDkjUBX1bXEEgiPIPDdfKVr8b3KC0/nZvgD
	LR1rfD2vuNxHLUk90dk0zPli7rPUXJmFFOz8d
X-Gm-Gg: AYBFou1CGw8FapjUYRVttqncIdoi04HuwZaNs01fVAnCkDlgBqIJ17YuuMqWYtBCXha
	SiUy0jvstgV2sEw2Ur2Xpoad3pM6ywclPpiMh5+/NiO3A5CUI8JoQxuBBTdc2sgZ0QI9syHE0cg
	Tv/U81ZRifR5ggXppvQ1NsxXaI0ClreUwQiI03M1w59Y2ZI24avgmHdVH/Q+XP+l2cP1pjjCniq
	dowLF0k9Vr4tAmImt7Y9xYdFhbBrzt2whb14Q0AiIJpH98qiURneGeVGFMGpgjudrISJ/03my7Q
	xqBBm5BmMV+0zW+CEWvq92Gy5FiARJvBQNFI27g/T5MlU8dDZEY2PnxPL7BwXscspkly8TjQVT0
	zIokPz6RLACVcGw8y7h84NFq/nvBOIZWDb4wJCt1QfJJg
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr18448528e0c.8.1788904794291; Tue, 08 Sep 2026
 14:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Romosan <aromosan@gmail.com>
Date: Tue, 8 Sep 2026 23:59:43 +0200
X-Gm-Features: AcwNN1VoLis_qTCJaciWzG8fuCVG19iFAIAUytuAB7zTbqg3IQjg-3SPQQCa67s
Message-ID: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
Subject: commit 108cc873398932af589c295f78c348513b8d70d9 breaks update-grub on
 btrfs root filesystem
To: linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Please Cc me as I am not subscribed to the list.

Running my own compiled kernel without initramfs on a lenovo thinkpad
x1 carbon gen 7.  The linux disk is the only disk on the system. Since
version 7.3-rc1 i haven't been able to to a grub-update, instead i get
this error:

/usr/sbin/grub-probe: error: cannot find a device for / (is /dev mounted?).

7.2 is fine. a git-bisect identified commit
108cc873398932af589c295f78c348513b8d70d9 as being the culprit.
reverting this commit from 7.3-rc2 allowed me to run grub-update
again.

this is not the first time i reported grub-update being broken on
btrfs. i reported exactly the same problem on jan 8, 2024
(https://lkml.iu.edu/hypermail/linux/kernel/2401.1/00596.html). maybe
the discussion that followed would help come up with a fix that will
make everybody happy.

thank you.

--alex--
