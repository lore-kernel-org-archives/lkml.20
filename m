Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801683DFC86
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536222; cv=none; b=TKGgr/ARQDKN7Y0YnII0lZsY3otbBI9nmAmdAhYlfzz2/xX3greD2CTcCVEaQuazMpboMQAt7uc46xEE+NYyz+uIcOWDuVGYmM//nIua4eNe7UNXSIRlzpj9cl+Nqb7iivfzs+5Knml4+xZ4yGux0CzIMsPPtHwdsFu1dHyI9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536222; c=relaxed/simple;
	bh=20Pj52OlbAiypYQZpIeAD4HXZ/yFkFkXgoYzMs3O8hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWtt5MKrt6i7A5NJi877Pa6Xo3P8TzkuK1pH+AP/pbnepmgp0bzq5/92aKYC8avFuM+UQEtUMdfwOWcrSxvbwlwp3u5bbpZqYOHKdwNgP7sdTilt6wB9YbLMbo9I0F1a//btMzdxAfiEZ9yvalQ09+pRbu5bCo3CMkH2cUu31bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=bhf0sDas; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="bhf0sDas"
Received: from trampoline.thunk.org (pool-173-48-119-87.bstnma.fios.verizon.net [173.48.119.87])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6998uVc1014155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Oct 2026 04:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1791536195; bh=byYbCPq7xCPv4hRFVrwMb1V7Xn0DnTEaO/f37jLIzis=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bhf0sDasJP/SLyPW/ayvF2LrxHxu4Jo3+dYC49zditdrE5e6NC8HykLfEZPb8SCUf
	 1/I7ECblLKMzojT5TTCV6aN0rQJFeouhZbeZA9Jk1I4APdcqWIEVpkarh0G0cyLEh9
	 03zQpa2AKUiACyUX/mqAzWmTpSXZs/+YPhbzxi73A0sJL1CSxDAKRCfe4d9LBw6S2E
	 1qdEJl10r0o1GpMqhM0dWJRStPuTk/Pbqiut9FSCMa+IRC6scuxGAO/3dtd2579ENL
	 kWD4wpdfdBVg3A+REDycxs/BF4VuNHfQPG+U28keaV1NClV8vgcaBDJC1uJG9cWyrC
	 ft8DsPMdLDHgQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 57D962E013F; Fri, 09 Oct 2026 04:56:31 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca, jack@suse.cz,
        libaokun@linux.alibaba.com, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com, jun.nie@linaro.org,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+4b03894b6ec5753ddf24@syzkaller.appspotmail.com
Subject: Re: [PATCH] ext4: skip extra isize expansion while unmounting
Date: Fri,  9 Oct 2026 04:56:20 -0400
Message-ID: <179153611729.860602.11393877192310890254.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824094512.2436628-1-hemanth.selam@gmail.com>
References: <20260824094512.2436628-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 15:15:12 +0530, Hemanth Selam wrote:
> syzbot reports a WARN from ext4_xattr_inode_create() reached through the
> unmount path:
> 
>   EXT4-fs warning (device loop0): ext4_xattr_inode_create:1485: refuse to
>   create EA inode when umounting
>   WARNING: fs/ext4/xattr.c:1486 at ext4_xattr_inode_lookup_create
>    ext4_xattr_block_set
>    ext4_expand_extra_isize_ea
>    __ext4_expand_extra_isize
>    __ext4_mark_inode_dirty
>    ext4_dirty_inode
>    __mark_inode_dirty
>    sync_lazytime
>    iput
>    dentry_kill
>    shrink_dentry_list
>    shrink_dcache_for_umount
>    generic_shutdown_super
>    kill_block_super
>    ext4_kill_sb
> 
> [...]

Applied, thanks!

[1/1] ext4: skip extra isize expansion while unmounting
      commit: 418adcde99032194416248168df810535a1a93f9

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
