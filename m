Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792555009;
	b=grB1hn6rw6WLv3bBWaYWLSxLhUWnOm0Onksx6rIGtUUMr//4zczsg4pzqeq16HVyzYRQ
	 +ch7cbR0WwesuBCsqwCyqxCWLSlIQvsf/qOl7WYs03OlvoEf7FtNrPaRET5OsYzIlgseJ
	 +hJLaadVyBVkfzkn6zagssptjIZ4MMVSY3pkGgpjqJE/6dURMFhMyCIx/Ewy5B096sax/
	 G48NMy/VobEtyu/gfMZCFlkUz84R2BFkzietE6Qhz2OlcIo9xYWylhZETMjARUk7qffDY
	 lGPtxs5a4TPJES+prsJVuDdVgo6ZkNxma6LY6B/2cs5c55ltAkGyGq+ecbeGFhV6q3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TsxIu5w5FY3ABJNnJou2C+ZIq2e5DebUIuAtyHX8ZHY=;
	b=kNurkipiCFwUdLh4VXptnR8ypb/vSVUqoVN4waXfeUiWIQA3ohMIAvDMgnt46Oq3hGRA
	 OySCO7rcwfS06B36F0yuW0W7DwGzb9BkBzHAwrv5j/M6Q4yTlPPTDwyUZ2oSG93isfkb9
	 Sajl3lJwmSYcZnlAGaDAjt8/50vvBXp43k9JAiJNoFxsLcvxMvvsuaB3Ro7GCfCIUIIyh
	 vEfgFeM7uXNh+0YaL3rj23RiXMLaYfg2FrQeu0YI03r8Apuw0G6v3bv2DQnbQ7VzPooQS
	 qjQzEq/mgo+TkdkLWYkRMtwY8Nzk/iiLAaa+sINd+fzk2c2Cu7HBqIWmKmrnF5c3aWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aL+Eihkq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aL+Eihkq
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9178aabd30dso3080236d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792555008; cv=none;
        d=google.com; s=arc-20260327;
        b=EA5BbZVEvKJfRezhYgtdhfla+GTawkZfZc3hTBTotZS57NiuQOzxgRyxovOopyHE3k
         uGKFncywE5Jq36TVfVaP4U9KU545IWqzILZzucodFk6nbIhSk15wxIEOyYbteiuE2Vyz
         Shn/w1MOBRZX1wddFzBaZPWF9q4IptS+5w0zUvviaPx6Zwb2tf26sg00Z6bpHOg4cxAt
         TyxnoEpv3jnK2tihoBHBd3bDx8j5cvTWQ5LpOy/VpwRenI8Kc83sj83jL3Pm/OHrRdC7
         4yOnMfNs1G8BJezZCG3NseZt/fpMG5U3fnXtfbHBL0skEwqjoC/i7q35ZmiCbpGG50ZR
         6XaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TsxIu5w5FY3ABJNnJou2C+ZIq2e5DebUIuAtyHX8ZHY=;
        fh=ZeH2cOyAxh2X7ooP7ZUF0eGw4pPDBGbWta2hmP8nNWE=;
        b=LxoDYPJ4QXbQ/8Zl73IgNxRq+iIYsQSBnRC8HBHr7tE6bkckPVIT7MCK5rIDHH6nYi
         Ph13lxYEDpe7k2gNFsA/ps39lqAawj2IfzSSrzMpvxl5X48YPVEycnBMn7M956G2NrEH
         yBIJG926YsTg7zs+RaNKmuDmlYXO0zO7mSkkV379zDY8YljLOOXA3WibyePb4E4pr/Ox
         LMNU8o/6vBU6dKMYZvEQT5CyDX6vwsQ5PggYDUlK9lsjOkAUuh4yE1CdmqPllXQAwnjJ
         djzJEbhhe1yYrI10OvMiJXyY/vXiyON8igQGHUCRpDTf6oSOvZoL7sHoPICCdAvlTxHt
         hfKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792555008; x=1793159808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsxIu5w5FY3ABJNnJou2C+ZIq2e5DebUIuAtyHX8ZHY=;
        b=aL+Eihkql5I2435do2UXmzZTjw8S+G0swn+RgK8kqDk4s/RGVdvrLOKwlYQjHWCTKK
         MsRNMDi1OItJ+BfgUKb3N3JitUpNb/cxGLxqNjV/ujmsI2V/T5akTWrXpBaBvzsoaxWl
         99WitaldvKWquvxj764wQpiTGzjEonBQgAomKgzssD7aCdqgq15zscQUoxQL7OPvK6cY
         NQO7eUGA0y4UW6YWNifG2olaIlFHW/ylik680h7hZr2b/z7oQmFaOv7FhOxNGA3lT7w7
         DLkN4USI4sjMYQYAOF5vEhP8CnE8VKRwzOEx2slax2gos05BXgN7g0wFbEeADwJhOZWl
         9kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555008; x=1793159808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsxIu5w5FY3ABJNnJou2C+ZIq2e5DebUIuAtyHX8ZHY=;
        b=is+eJhovi9sY7jPBXH0UafC4dKvh+UuYBI+oDA5cFQpMatNDmPhjF2cl1l2vfTyFLq
         /cCmWPFkz1bjM77zrr/VI+fE22V6y3g+WkAtFD03DlOBBX8Q+Bd8frnjPfQ//ZvCRP0g
         Fm4oOpz7bIlJhC3U3D2xWWMfDHgmCkjIHX1vVe9cMRHxruw/wdEfVtBQF2gVBGKH2v/c
         jNEPb8ulZ6x0hT/K42I5MC5UfmVvNX2RvGHSTveGIVB/bOitnRtsABZxNYWi2JTkk++y
         R1X6+tzhNcN6hO8L8o9UeJ2DNJldwL/ETnIoQIBtTBesOlr4RdH1lG0hkSbsz1h2erA8
         1/lA==
X-Forwarded-Encrypted: i=1; AKwUvBz7ZzM7zHIOU6BN7wNo0l2C6g4qYqSBM/5sSqH5N2yT4emiUq7bcstVUk81aD/9XjHmNoE7N94SoGZzqkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCEnTaIpdrJGjfmfUaZiJGDpGRzUJ2E6p/45pJmDDB9B9TvXCW
	THF2aMD+KC0pBZoEYc4GK8cvSqvUi67F8GPPzPFnxw2YrbOHYO/fz5868igDs08V2fBA+htQMvb
	jwgW/GEEthSUiZwYz9vMDCXlAxusC3bk=
X-Gm-Gg: AYBFou1v0xhAazx7zJ240wtVH3w7LRd0zYIH+s8/YCXmTVTjlDLObuYv1Kd4WjFXtxB
	jrZLL9HY+evv3YBBaMo/1JRfoFlCIrug8gI07/KUZnsvdflGF+SuCOcNLowt/EowcAypGGAobMq
	e3JvQeribj8nTZEIFhegi0Pa+d7KoOiPlg1e3I8SmzFINotsVY6x1a6WKPOlKZ0ODo96a6dASGl
	DbYmaS4muW3smrksznvnIxCHjoWHDyNmWG3nCOzriXPOaO2HoKQ5TR6qUfbGAHBBt8fUMNgslPN
	Z6CQhkU4A+ryvS8L9jw4vZpMc4kEG1gNpmX6qFuf1JHE1PYcJFhl2SB94S9370QUZCAp438LI2A
	+NKBuCqch7f2vmvyKCUfg0oizHqV+EA9g0d0w9M8Y9dn7GbbMk9/9zEOwU7zVQsObVAga
X-Received: by 2002:a05:6214:2b94:b0:914:4511:9271 with SMTP id
 6a1803df08f44-91c12f031bdmr16014616d6.22.1792555008068; Tue, 20 Oct 2026
 20:56:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020175254.900284-2-bestswngs@gmail.com> <CAKYAXd9nwp=X8AfzqTs9231i6SVoX7wuBqVvUfgBP2a8xrt+ow@mail.gmail.com>
In-Reply-To: <CAKYAXd9nwp=X8AfzqTs9231i6SVoX7wuBqVvUfgBP2a8xrt+ow@mail.gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Wed, 21 Oct 2026 11:56:09 +0800
X-Gm-Features: AclHuK9edLT7Ue1NZq0Si5aKsqQpW65ATZGLO5S5vLoxrR-P6z-TcbrWHv5GkKc
Message-ID: <CANgPUi1Tn8vvQTWNCXUB9qPmy-LqXk_G8YiwS4DMU2kei3eHaA@mail.gmail.com>
Subject: Re: [PATCH] smb/server: prevent file publication after tree disconnect
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org, 
	co+d531129f2f9fbf88@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Namjae Jeon <linkinjeon@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=B8=89 10:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 21, 2026 at 2:53=E2=80=AFAM Weiming Shi <bestswngs@gmail.com>=
 wrote:
> >
> > TREE_DISCONNECT closes the tree's published file handles before marking=
 and
> > removing the tree connection. A concurrent CREATE that already holds a =
tree
> > reference can therefore publish its file after the close pass. When CRE=
ATE
> > drops its reference, the tree can be freed while the published file sti=
ll
> > points to it.
> >
> > Mark and remove the tree connection before closing its files, and seria=
lize
> > both new-open and durable-reconnect volatile ID publication with that s=
tate
> > transition. An opener is then either published in time for the close pa=
ss
> > or rejected after disconnect with STATUS_NETWORK_NAME_DELETED.
> >
> > Keep a tree reference while a file carries its tree pointer. This prote=
cts
> > asynchronous users that can defer the file's final destruction past tre=
e
> > disconnect.
> >
> > The close pass can race the successful FP_NEW to FP_INITED transition.
> > Take the opening request's file reference atomically with that transiti=
on.
> > This keeps the file alive until request completion even if teardown rem=
oves
> > the ID immediately.
> >
> >   BUG: KASAN: slab-use-after-free in proc_show_files (fs/smb/server/vfs=
_cache.c:126)
> >   Read of size 4 at addr ff11000101540f80 by task poc/153
> >
> >   Call Trace:
> >     proc_show_files (fs/smb/server/vfs_cache.c:126)
> >     seq_read_iter (fs/seq_file.c:231)
> >     proc_reg_read_iter (fs/proc/inode.c:299)
> >     vfs_read (fs/read_write.c:574)
> >     ksys_read (fs/read_write.c:716)
> >     do_syscall_64 (arch/x86/entry/syscall_64.c:84)
> >     entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >
> >   Allocated by:
> >     ksmbd_tree_conn_connect (fs/smb/server/mgmt/tree_connect.c:35)
> >     smb2_tree_connect (fs/smb/server/smb2pdu.c:2819)
> >     handle_ksmbd_work (fs/smb/server/server.c:368)
> >
> >   Freed by:
> >     kfree (mm/slub.c:6801)
> >     handle_ksmbd_work (fs/smb/server/server.c:332)
> >
> > Fixes: f44158485826 ("cifsd: add file operations")
> > Cc: stable@vger.kernel.org
> > Reported-by: <co+d531129f2f9fbf88@bugs.sh>
> > Assisted-by: LLM
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> This patch does not apply cleanly to the ksmbd-for-next branch. Could
> you please rebase it onto that branch and resend it?
> Thanks!

Thanks for the heads-up. I'll rebase the patch onto the latest
ksmbd-for-next branch and resend it shortly.

Best regards,
Weiming Shi
