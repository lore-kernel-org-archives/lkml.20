Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689963;
	b=rO6AWe4VfcNAFCvSU0hZA7mxL7D/CeXV4++3nCDUqCZn8wwZfz81qjISZz7X6acWnVEF
	 rFM6N7gvyt2sJj9a3aWD45N1LBO6fK/57Myu6efHwCrBqehh45EzTtXwBmEVwlaA5hral
	 lwVek6bA2vHrnx5fMRNkKXP9MueR3yLjU/R/RsVYMQ1ecxq2/792CUCTY3dcDN8qDwtTD
	 +KVLZ+7JaJCMV74TuDCdEWmr/9QZ37l3FpqLa+jRId6kmdIxDJhqBk3qpkEGlvU2Rz768
	 zQ8cznj7yCqK/fRVCuTVZaqA7X7Pli/EETFAfXXsqDJ9YkUIVIqgt05rBWexP3IypVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689963;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ohwfz2Bnt3mZ3+nWVRMfEllAG60p8dGncZfB91/Kah8=;
	b=tHJPJnBjaXFtPeCbfSUWT7a/+Zj1gzbES6fM+jd4Wv9AS8Qt4p2VvOoq+7ElUm65Pw6y
	 LoMHJ4JKEtwOxQ3XBqJWp+G4PSyhDP0mDXI9bidtxwACyTwRYfLKqLnM0JyDJAXbK1lTo
	 X9Qnzh1qvK6CeAK/NSzbtceYut0BsHNNui8eaOY3PHlFPQoAwlN6KbUaXeVKRHyJfVi0b
	 OpXdyk/08/g7Y1QqL2G0tKpVVUkr6EIN5f949b9P3L1hVt2Y1FVN3fAtsfHzqqXlpy+ZR
	 PIoYtFP03jUtwltgSMvnBWY4tXsI4DnyPMLbUUPywKGENRzSpFcSi9qrh/eTsbK7Qrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED5606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CED5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so1629872b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689962; x=1793294762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ohwfz2Bnt3mZ3+nWVRMfEllAG60p8dGncZfB91/Kah8=;
        b=ULccxJqHDSEIOJiOUfHE2p95oYbM1ZSQf82HLdkAaUOkai0zadeosDz3jgSZsj+1D7
         /5ZguiPkkfobtBgqPwJqZ8N5AzoApkh/oNrLIoSBVjvKW0GFKuBZFyjd8yt+siEFSrCf
         oJkNvoWCBpltpcC8dOvIembZzHqnV9Hcfgg+qgN0JwqTB2BkjvkGfUhgldPwrsZNGCap
         V9MVAp6n5WvwzrxDRnOg3aJBrCCSL+nFaXq036z5Yk2rhMbTdwI3LwSrHF1i3LugYWyu
         W9SWMTXdzHpT+idZXn7/OBqlB9KlD+g3VUWXiqLKrWHjqG6Hjq3kUbPfaWyfb8H3RCDZ
         O7fQ==
X-Gm-Message-State: AFq9FYLLGMyiFUsCUKaV5K3bjfq4mgSRDHVCk1snMO5fGXhh9umvRXcA
	qVrlOD7punn1vEaFbHBXNndE45dyWmkm8USAYWecMK2vHTKZYmAM3/q6hfqeh8ZbNjhbC40QgFI
	5rbJyTucX39cDMWBXy78mferBO+rDjWzK4Ho1MoFu5Suv2qSEs2OJJKhdMHA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c224:b0:53a:1c29:cb37 with SMTP id
 5614622812f47-557ee87e5edmr1763362b6e.38.1792689962374; Thu, 22 Oct 2026
 10:26:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:26:02 -0700
In-Reply-To: <CAO+rqLihzHZx5kUUdR7mcC=yApCUP_20OEh7KZOQhHY5_+KLYQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada472a.3ebfcf67.79b0c.009a.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
From: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mike.michalo@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/main: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "a5a65480fd08f84422d56537d217faf190618d6e" "main"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=521f7e7e2b974abde99a
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130b953e580000

