Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0604E36CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889372; cv=none; b=BrLJoPBY8sd1inhModC4vDC0I8r322G/rFDTZEw6yX/3bz7HVBhS+Gb91S6W8gM+f9pRkU/xiQ4uh6Ev9ullKFIG+6dg+X7lMaOr3Z90uvo0fohNk8NeLcak1DyWbWt+Fv4usDmGw7OGGDL9AkoJKvmaav2ZtJ9TPAIIzBtRFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889372; c=relaxed/simple;
	bh=TQ1Y8utDeuENqeSwKfZ3I/riD6Qj6YmGzuUsxnLbTnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7tvS/q0iQJqiRL7yiItREXJNwemWfhCLz/k5HWNz0vWDt5AN8YQ/WbjOkgWn2Vd216oD3f6hIvstZ1rXg5Lv8TaMGwAjlqitNYpY6NSO1vQS8N+th4oX58eXETySlRDuIFILEDj43IEbm0NAbnlTNZgkGwHfJYXqVAmcURbJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9b23fc3ac6f511f19a56ed5b684f684d-20261013
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6db9e078-1538-4d08-8ef9-9329f447ff6b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:597e9dc93505a2ad45b7ff19eaf9495b,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|850|865|898,TC:nil,Content:0|1
	5|50|99,EDM:-3|-100,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b23fc3ac6f511f19a56ed5b684f684d-20261013
X-User: duanchenghao@kylinos.cn
Received: from localhost [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 675544311; Tue, 13 Oct 2026 19:02:39 +0800
Date: Tue, 13 Oct 2026 19:02:37 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: jianghaoran@kylinos.cn, avagin@gmail.com, linux-mm@kvack.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org
Subject: Re: Question about obtaining LUO session FD for non-systemd-managed
 service
Message-ID: <20261013110237.GA836401@chenghao-pc>
References: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
 <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com>

On Sat, Oct 10, 2026 at 03:05:40PM +0200, Luca Boccassi wrote:
> On Sat, 10 Oct 2026 at 04:11, Chenghao Duan <duanchenghao@kylinos.cn> wrote:
> >
> > Hi Luca,
> >
> > I watched your excellent presentation from the LPC conference in Prague.
> >
> > I have a question I’d like to consult with you.
> >
> > I am currently working on the `memfd_luo` feature in CRIU. My goal is to
> > leverage the LUO capability to store checkpoint images inside memfds.
> > After a kexec reboot, the image data will be retrieved directly from
> > memory instead of from disk.
> >
> > Here is my pull request on the CRIU GitHub repository:
> > https://github.com/checkpoint-restore/criu/pull/3152
> >
> > In the PR discussion, avagin suggested using systemd as the CRIU daemon
> > to centrally manage LUO sessions and access to `/dev/liveupdate`. I have
> > watched your talk and read parts of the systemd source code.
> >
> > From my understanding, systemd currently provides a unit‑based solution
> > where child processes can inherit LUO session file descriptors. However,
> > this approach requires the target service to run as a child of a systemd
> > unit. As far as I know, CRIU does not run as a systemd‑managed service.
> >
> > So my question is: for services such as CRIU that are **not systemd‑managed
> > child services**, how can they obtain LUO‑session‑related file descriptors
> > managed by systemd?
> >
> > Thank you very much for reading this email. My knowledge of systemd is still
> > limited, so please feel free to correct me if I have misunderstood anything.
> >
> > Thanks & best regards,
> > Chenghao Duan <duanchenghao@kylinos.cn>
> 
> Hi,
> 
> At some point up in the stack, everything runs as a systemd unit, so
> it's only a question of figuring out in your setup how to pass the
> FD(s) up and down the stack.

Hi Luca,

Thanks for your reply.

The `LUOSession=` configuration only takes effect for services managed
by the system manager. If I run the CRIU command from an SSH login shell
as I am doing now, the environment belongs to a transient unit under the
user manager. In this case, we cannot use `LUOSession=` to obtain the
LUO session fd via systemd. Does this mean the process needs to open
`/dev/liveupdate` by itself to create the session fd?

Below is the attached service of the process found via `systemctl status`.

[root@localhost criu]# ps -ef |grep criu
root       57589    7729  0 18:25 pts/2    00:00:00 ./criu/criu dump -D ../test -t 52922 -j --memfd-images -v4
root       57784    7571  0 18:27 pts/0    00:00:00 grep --color=auto criu
[root@localhost criu]# systemctl status 57589
● session-5.scope - Session 5 of User root
     Loaded: loaded (/run/systemd/transient/session-5.scope; transient)
  Transient: yes
     Active: active (running) since Tue 2026-10-13 10:03:55 CST; 8h ago
      Tasks: 4
     Memory: 148.9M (peak: 1.3G)
        CPU: 47.000s
     CGroup: /user.slice/user-0.slice/session-5.scope
             ├─ 7712 "sshd: root [priv]"
             ├─ 7724 "sshd: root@pts/2"
             ├─ 7729 -bash
             └─57589 ./criu/criu dump -D ../test -t 52922 -j --memfd-images -v4

I'm not sure whether my understanding is correct. Could you please
provide your feedback?


BRs
Chenghao
