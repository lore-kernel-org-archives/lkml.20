Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579009;
	b=1vGjkGBqyuwtz0VGRopLH7/JyUCWZt37nogC6YEwtLBr03PxA98xjvHBkq9v29VhEvgL
	 IgpK9SiUURSxMMwDPVjxCztkcxQunK5dwWywELBAyRj1R/lnkUbLGD7xtqInzMSlUUsYY
	 TzrMTmjbjgFANIXYGgfA0aA9a4b6ev5RmYmf89igDsHUfEiQFifzzKFj4qA6ZcRYI9Izr
	 i8Q7zFvgXYXktjfKm3mEWF7oWVnGoJrv/8705dhnOmcTxshCBdB3PVv24l4fNrQiAzGMs
	 n1qsOxcq09ATGgagTbuMUKFgiNiLycJcITSKCJasuGyDHI0HIKyC3JZG3XETbU/CsZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579009;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=4a8dTd8W549kARPYgxWqM4QrBiNO4UU5WeCrYJf8hzI=;
	b=5Aad20dmr13aQLUyRsD0uVqyIFRaDRKXxMpX079sWZ+MViLCzPGgkxZAWft6pPgg7P5A
	 O2EeNwg8iWJsXxENJ67a42gnpwRQEhzPPahNUCRRcod9a7kbQfREYF//pbFNNWrfaGM79
	 mlebJIgycYiCEUPR2HT9h5R1G94whqtRGlO4Vmi/uLRTPWOLwvZA0Ozn1+u1nTYEipt4Q
	 hVhSOg26cnJi/IZJO3IKfMoiRnlWlcopsvbIx+joDqLSRzNYWj4nBql/Wzqv6Rk8T+u/w
	 vaMVOuyrBzm9s+mHTS275nGhKWbw8VqzVbksbDJiqZIcc0jf2mIG8W4U90vqn0qFhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D64E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4ab90578cd3b11f19a56ed5b684f684d-20261021
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, UD_TRUSTED, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5cdad1f0-615d-41c5-809a-f2fe534bd61e,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:5cdad1f0-615d-41c5-809a-f2fe534bd61e,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:1bd38fda213d37dd9cd1ec9cf075d221,BulkI
	D:261010210608FCZ9WBJC,BulkQuantity:7,SF:10|64|66|78|80|81|82|83|102|127|1
	36|841|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:1,File:
	nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:
	0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ab90578cd3b11f19a56ed5b684f684d-20261021
X-User: duanchenghao@kylinos.cn
Received: from localhost [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1052165201; Wed, 21 Oct 2026 18:36:36 +0800
Date: Wed, 21 Oct 2026 18:36:33 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: jianghaoran@kylinos.cn, avagin@gmail.com, linux-mm@kvack.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org
Subject: Re: Question about obtaining LUO session FD for non-systemd-managed
 service
Message-ID: <20261021103633.GA1324331@chenghao-pc>
References: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
 <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com>
 <20261013110237.GA836401@chenghao-pc>
 <CAMw=ZnTksVT1wuQwAjzz_2tYSCvLSxeUBa3mYQvCFuKUtcydaA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMw=ZnTksVT1wuQwAjzz_2tYSCvLSxeUBa3mYQvCFuKUtcydaA@mail.gmail.com>

On Mon, Oct 19, 2026 at 01:13:28PM +0100, Luca Boccassi wrote:
> On Tue, 13 Oct 2026 at 12:02, Chenghao Duan <duanchenghao@kylinos.cn> wrote:
> >
> > On Sat, Oct 10, 2026 at 03:05:40PM +0200, Luca Boccassi wrote:
> > > On Sat, 10 Oct 2026 at 04:11, Chenghao Duan <duanchenghao@kylinos.cn> wrote:
> > > >
> > > > Hi Luca,
> > > >
> > > > I watched your excellent presentation from the LPC conference in Prague.
> > > >
> > > > I have a question I’d like to consult with you.
> > > >
> > > > I am currently working on the `memfd_luo` feature in CRIU. My goal is to
> > > > leverage the LUO capability to store checkpoint images inside memfds.
> > > > After a kexec reboot, the image data will be retrieved directly from
> > > > memory instead of from disk.
> > > >
> > > > Here is my pull request on the CRIU GitHub repository:
> > > > https://github.com/checkpoint-restore/criu/pull/3152
> > > >
> > > > In the PR discussion, avagin suggested using systemd as the CRIU daemon
> > > > to centrally manage LUO sessions and access to `/dev/liveupdate`. I have
> > > > watched your talk and read parts of the systemd source code.
> > > >
> > > > From my understanding, systemd currently provides a unit‑based solution
> > > > where child processes can inherit LUO session file descriptors. However,
> > > > this approach requires the target service to run as a child of a systemd
> > > > unit. As far as I know, CRIU does not run as a systemd‑managed service.
> > > >
> > > > So my question is: for services such as CRIU that are **not systemd‑managed
> > > > child services**, how can they obtain LUO‑session‑related file descriptors
> > > > managed by systemd?
> > > >
> > > > Thank you very much for reading this email. My knowledge of systemd is still
> > > > limited, so please feel free to correct me if I have misunderstood anything.
> > > >
> > > > Thanks & best regards,
> > > > Chenghao Duan <duanchenghao@kylinos.cn>
> > >
> > > Hi,
> > >
> > > At some point up in the stack, everything runs as a systemd unit, so
> > > it's only a question of figuring out in your setup how to pass the
> > > FD(s) up and down the stack.
> >
> > Hi Luca,
> >
> > Thanks for your reply.
> >
> > The `LUOSession=` configuration only takes effect for services managed
> > by the system manager. If I run the CRIU command from an SSH login shell
> > as I am doing now, the environment belongs to a transient unit under the
> > user manager. In this case, we cannot use `LUOSession=` to obtain the
> > LUO session fd via systemd. Does this mean the process needs to open
> > `/dev/liveupdate` by itself to create the session fd?
> >
> > Below is the attached service of the process found via `systemctl status`.
> >
> > [root@localhost criu]# ps -ef |grep criu
> > root       57589    7729  0 18:25 pts/2    00:00:00 ./criu/criu dump -D ../test -t 52922 -j --memfd-images -v4
> > root       57784    7571  0 18:27 pts/0    00:00:00 grep --color=auto criu
> > [root@localhost criu]# systemctl status 57589
> > ● session-5.scope - Session 5 of User root
> >      Loaded: loaded (/run/systemd/transient/session-5.scope; transient)
> >   Transient: yes
> >      Active: active (running) since Tue 2026-10-13 10:03:55 CST; 8h ago
> >       Tasks: 4
> >      Memory: 148.9M (peak: 1.3G)
> >         CPU: 47.000s
> >      CGroup: /user.slice/user-0.slice/session-5.scope
> >              ├─ 7712 "sshd: root [priv]"
> >              ├─ 7724 "sshd: root@pts/2"
> >              ├─ 7729 -bash
> >              └─57589 ./criu/criu dump -D ../test -t 52922 -j --memfd-images -v4
> >
> > I'm not sure whether my understanding is correct. Could you please
> > provide your feedback?
> 
> That's a user unit, and as per the documentation LUOSession= is only
> supported for system units. So yes you have to provide your program
> with privileged access to the character device and create the session
> yourself, and then stash it in the FD Store as normal.
Hi Luca,

Thanks for your clarification.
I now have a rough idea for the implementation: CRIU will leverage the
FD Store facility to deposit the memfd into systemd’s file descriptor
store. As FD Store is tied to a service unit, a criu.service is
required. The unit file I intend to use is shown below:

[Service]
Type=oneshot
RemainAfterExit=yes
FileDescriptorStoreMax=10
FileDescriptorStorePreserve=yes
ExecStart=criu command

Does this setup conform to the original design intent of systemd FD
Store and LUO? Please feel free to point out any mistakes.

BRs,
Chenghao
