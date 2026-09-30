Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F774D98EF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772587; cv=pass; b=KZdQ9wyQ6mVdLikfXmN+TwAwXCd+tIyjVyo8JbPw03Yyk0spMWcGpO1K+D2dJyIlisgGFU+KbEawWjcuwx5S7Z890byU5eo3kZfakmCbrfhLwmDJ6TbHXXKS6ttSL2ZZDsGgWlZQNZFfy53qnsDj4kKNVFplRVj2pThwbrIdBKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772587; c=relaxed/simple;
	bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9MEyE+t3NUi+i6xIcW7JPGMOVTxh6XJ1i6RGIhhHJFKna7dgkQ75mRlYbnrBy192F7Xz7u26K81fPN38hXpBHMdxM53PUhRysS9iu6mifiSo9pd7dR1n23HEHdGZ49QBIG/C3SjJwS9G8GXXLKBG1OvTyUtU1EoS6gKyZfBS0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVLIWps/; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVLIWps/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba406b9539so30697e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790772576; cv=none;
        d=google.com; s=arc-20260327;
        b=NsCjD7VmwdFrOvFJXqj2CXwaFhHcFXHKap92gcNCIkeN24NRr9bXyhPGfxFcKJmxir
         xXJ7FMMnowuQLgdznPTWnyHepkmXG3wvtwvJSPY/OFcRRjekiWPU73nOGNhpxnemsnA7
         DarffSpt3lOAoPL/qT3JabAnWbp4tDaJbgbalxPCJxk0T3OW+qp8EVyzM8S+f9tU33Kx
         pcypraFm39KWzGqEr2VhXDTy5iOl3KVUI1snA7FxkLHOcoUeT9AzIaaO74hpCm0MsxvN
         7wZuegIhA+/6xxId2hL3+44y3jC/MQQ4WN85oK+XnNC7JyVMpHT7O4PF6KCzLtpWqcHT
         Nzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        fh=1L8LpmjNO4j/T3oNrS/57DSuHG5upfQv6rKOrj4Vx+c=;
        b=HGbBflcg8PhPTWdSEyqBoc/Vo2Arg3KtlLm91rVjhjQDqFwRg4TNdkRNZM+f+gnhrU
         dnnhxCPwiHU7C+LjbgyIOaFRHY4En/NzdBc7QGa3aopRTc90xD+dteRj5OAmwXo7As5D
         Z0cikN8u9Z8a8a8dH0a3NLScbXMxG6wpjgSSSI/iZ31xi/6yE5wQzEuZWiDJcF8Fj/n0
         +kzYsR0Rt+6OYTuVvusW1LnzuHubzHJBinVkAnQCv8Y7TB7pmXHQQ1P7xG0CXKNNYwUT
         R4vRuTRaxgAQDqob8H/7raxJ5V4L6vNlH3yUxn175Z1sMHCpmU6BriszEC1IFVgpR92P
         pplw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790772576; x=1791377376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        b=bVLIWps//KcFCIeElGupaj5xfoBq2LTL9IXt26uLAiNuPIinhvgjQFZFSykZxa4Sg4
         Whl51hwKspnA/M0282g2WvQxvRGZxRe9FXBnTaRaEv8L2NVwBGwwJe7CQuQxpVmnvdxM
         crH7riHMl012R9xETyigW+dcAVUoMm+trgjRpquMJGHC2CTTSTbNWVXon3apA+UEi/4P
         EWbG4IB9jRJAykz4Os7pwPhRT3gLF7CDBVAmHlMUXvhxqR85Anu/E7ecfRrtor63Rqaw
         n4oU7kLReGH0Jg9Ux3gITzbJ/J5DEYQH/Kein9LugNsRZsITU1HLVUV8MA7MtW+0iMcN
         Bj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772576; x=1791377376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        b=vuVzJ2dMyhotHSdamG7CgppX/xM8246dAhRPTEmbwMCkzgj7+tnhFpi73S2OhZdWUj
         JZdPpfqLddHTO+j7+W/LomYp0JbqnzNBm5bQ5+BldFK5vJBB1Xtd2pgVstzqpKCf7914
         fXoQ+97LUMWR2Pc/NX5xmJhcAekbuFKdGFcbbGxjuCa9YwlCEfgRPBmCDgnbmNJ6Bbti
         PzQb1vJJ24DSKe8rTmzHS+7ONcSVjPkYwIxomnzPx6mdNUja0qSUJCk45gfMT89vxMQG
         TdY3IYFDwc4hP0LuLhCxk2qNJyyLgYKcsG3b41sCUmGSlNKDsQm6um92bmWgaroDHwl/
         D0NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjLWidZeqpGpWTCFpHzyizkpv6k5nXBtXdmlEeL2r+VKiE59RDh7oS+okDRIJvya/ZK2g76vBFQWP9tnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLdi0bgezhXU89CkPQ91ujMZG+IXpZcYKXx/FasY8vK7kF7Lhr
	7uA2/4SHu2bW/Ue3pmZ49J3fbeLDQp9Ctl10ZqrlEUUCW+37WbqYzqcoLqJn2VOAN1mHJmbCWM7
	eSPaPYmuwMbyvvi0LU6PsvPr0ltDjx5g=
X-Gm-Gg: AYBFou3gLXL6O0zG2fxk/N4ETDEd2nBWF6U/BZ0SLL0dQgjdASDc6v7gHjVft5v4tp5
	OXMbp32mXZHzofRuN1nGxVnQ/6ofNMCKucha96yFZ3t3QKwHDCQgR5Rh2DS3wzN/b6T5hCPFJy1
	gX0as9I10wtOwflPUL/ps1eRkjp+7WhExcvFpqDWip4+x+coEgsR+fvh+jCGLBi0Z/a9XEI3GP8
	8fVcM9T7tL0x5bsUFoBoBEQFCqgjgcN+Ur5LzheweFeBuheWDSVH7qOr+95ZuN1PVn8sgEI3cnD
	ASWAgY9VSK4SPVfHyToJopzTV91JL0HpWQm7PVLNB7xPXb6Jx0kAvRgcCNMHUkvDMvg0VLNkikJ
	HjNd9WIUFA+83F4Bf55t8Hcy/LyxXQHt2iG8IboCwml3/OpNsuwFhJP6kaYdchaKFqqqB
X-Received: by 2002:a05:6512:3b8c:b0:5b8:f271:2663 with SMTP id
 2adb3069b0e04-5ba4027b025mr588514e87.0.1790772575773; Wed, 30 Sep 2026
 05:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com> <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
In-Reply-To: <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 30 Sep 2026 20:49:23 +0800
X-Gm-Features: AclHuK-D7zf73Knh_TxmzrGJ4myJh2q-dTjIoLvdAmBeYKhsQvqC75aL9WGox60
Message-ID: <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"

You are right, and I should have seen it -- the rest of this series is
built on that same expectation. checktransupdate.py also finds the
original purely from the path, which is why 1/4-3/4 move the files
rather than fix their :Original: fields. By the same token, at their old
paths the language switcher cannot pair them with their originals
either, which is a better argument for the moves than the one I gave.

Thanks,
Chen-Yu
