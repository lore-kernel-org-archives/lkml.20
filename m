Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310522C21D8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916280; cv=none; b=C/XG2pFN+ELhkpSYsHCComszqHrpp8uNRukZzOHsyftIu62YL7bXj7jl8Wnzr8MgyRBwaggvSKUE/V7QyfqTO17tU3VnuPinyGbr0wI2trYoj3axoNfcfhgzLsiniIDQ+RwftOielAz+52zeaBK2vMv850U46BReD36umMhVvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916280; c=relaxed/simple;
	bh=LfCwnXg7o50SdS3HbtfQg8wAQfDs9K5Jexii2uLlIuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARPpvRwDW++51iS75UxqfxiwghZuBeTx9RVi2SGGBS7YsUzDuxwy4HBQQFQqYxVQR/KkdamBzhy1vfy/MrnwxMniAt8PmQ3iMrRViZtk42tP2jgIXNJqUwakO2zSFBcauHiiqxBAxrUJXFhKXHcm6P5g943L73sb6hM4z31dwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 68KEvRBI056671;
	Sun, 20 Sep 2026 23:57:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 68KEvRcM056668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 23:57:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c61141d7-eaad-487c-9258-117a96261db3@I-love.SAKURA.ne.jp>
Date: Sun, 20 Sep 2026 23:57:25 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: vub300: fix sleeping function called from invalid
 context
To: Johan Hovold <johan@kernel.org>,
        =?UTF-8?Q?=C3=96mer_Mete_Kaya?=
 <omermetekaya0@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, cjb@laptop.org,
        tony.olech@elandigitalsystems.com, linux-kernel@vger.kernel.org,
        syzbot+0e06aa1bdc6495bac24b@syzkaller.appspotmail.com
References: <aoR_1vXMIqIdBDaI@hovoldconsulting.com>
 <20260818180514.71765-1-omermetekaya0@gmail.com>
 <aoXAbneEwlouktIx@hovoldconsulting.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <aoXAbneEwlouktIx@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav114.rs.sakura.ne.jp

#syz fix: mmc: vub300: Remove the driver for the obsolete HW

