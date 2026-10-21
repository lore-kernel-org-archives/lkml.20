Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606621;
	b=vItGPmdkgnwcfmV/lDLirA1oUTl20Akzx/5eaaLXBEkBVFNpEZzREBnuu2WE9nNS+w0s
	 gp1u+HRmZjQ4yXENiL+0SF9aH/RXX0zbnAJo+oLGAtkDfY3xU6h+APHbqLhKCp6SnLpNv
	 ti/8k7zUkYzpr8gVXM2x59MeF/lSrcD2rFyTK95VUood3DKSUZCsf+4bhAuefhnR7nMyQ
	 w9hUrF36nsPP1H5FNj1vpYBriGjoLSmB3zEz91rj2O8nkt4cBvRAUZQvxHD9ocHldLmA5
	 rKvxNdNpnqU1N5u3wnDIWwu3Ed9Dx8v274V/2Y3zktj5e5lhAqDIXiOSaZ32US+HaAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mmr/IR1zCY9h4L4dj3m8FpWvL2EHS7s4xmQLBcny3D4=;
	b=FZ+3OUB07ahyFWUfbbW/GH7U18NKylIbepdkA0xX76GVCidP72t4c8J+u2U4Tu3qz+UC
	 V7CvRYWJR4hwhNXfycm8cmJew0MKn5Eern15N2GuxW1AeYPFdu7/nJy0QPGSWw1kQyhkQ
	 wBfC9dhs8eRr4MZgzkzNE9QAK5s2JOKFObMMG6wpI1ITiJn9xwvGctKI/PH1rfLsOQxbd
	 vEcziuTSf47OffXnRtBtD3+KeA6K6GDM+ECVdUgkW20H9TquiAY22SQRykqkZ/9/DdLju
	 NZzjW69M+5wn5vVwa7E9i5YRk0qR8kO/KkWO8gigby5SahGUemyj5Cfy3a+JzC1Bucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JVptMShM;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA01606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA01606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JVptMShM
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so2819296eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792606620; x=1793211420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mmr/IR1zCY9h4L4dj3m8FpWvL2EHS7s4xmQLBcny3D4=;
        b=JVptMShMD3lOCav6lLV1cSuKUNsMSZ/4tlwfHZEYmxdDzEKjsU63xcZG1pKs/01+gF
         A0TIkF1+Nf6jSYSFlBlLqj2S/3D6aiGpRcgMSqFU6RjFriYsv6JP0IV1sHq541JAM8zm
         0BK6NJOCXuHoVgG/aOWc25EJYVJLMl7/1mcLw87pAQt/3yGP/1b8of+LVO/UIeUotSmi
         dRF4sr+Rn7nY1V7Iehcbu3kOE5UcRZ5Vlw9DcBPpo71sQDfqbt340CRaxBU8W9R1O+iJ
         38oWk87PT6v8gE+SZ9z4Ovvl5lFUcSPrvP36mYf5muqI0ArpqJg04uNh5FKpCDf4JUJX
         P0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606620; x=1793211420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mmr/IR1zCY9h4L4dj3m8FpWvL2EHS7s4xmQLBcny3D4=;
        b=ZCycqmbl45Dt/JcZuu/qTBja4bLPnRCfqF6lPUHZd8WWY/BQcq+i4gOAGDIaGOfXal
         HCXiN1EPZqtzBggDUm78Mr1GyFexDMhvF2XQnCuD1lfmUuQdcJVpVh3450C72VTIOWt5
         24P9Xt5tnFQOZ5Bg3TO8Hg4eirVWM0DP4876uG8OJzdnwL7O29V0DBrw1P2+6JillutM
         HU/bz9I+PubVl1esZkniWPpH33d6LoPRLjEs88z9+A7cOVoOdLnsT5cm3rjaSYCJRgzQ
         t/6UK/Q+ngqc6bzMH+HbF3k0rDcxpiSgpXXptWEi/ZgGVRAPksNuJHmErIoDRmvaGiaX
         HbnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH99d+SRzIH9oMOvWBu365xBIHTF/38rj6kEC/kByYHokjKqJ2Ernj7XidJKr9yovbHrhfQUfKpwTcMTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8I+R4YM6dYTPzu54SVJ4xbDDshGn5H3vYReXWDQq7r8p0uV5e
	baor/Gq1AD1DUmyq4d/MH+3KVkd1SwQc5ThEjzPgOYcmZ+zedzaqxCErkX75tWku3Ts=
X-Gm-Gg: AYBFou3JBvo5kaIkH/t6LltCxKC/zNsNz9sot7TmIi/w3VglijjETFvvXZPE75rYbe+
	aP7GYNjblIEZkbwkZSdkvsc6CCD16lb+DDidtEm3rXm/ejgEED943w2y+g0D7EH2UeKN1080GOi
	ojZFZOYih2E8De8btYpTzusY+3RLfYEQBzU0YEwWzyHn5p+fjIv4UyMhjeMJ+RaKGK/AzKsVxrV
	b2V1q7N0UlvmvUmafmodn1mnZHmQUrrNIpwmyM8ELy9QYFxLgzyftxbHKRYdz30/qwDHTzNpEi+
	OCmakY8HceS/vP8iKfiIYFMHs9G4lY1KJJimHQpKywaoY3SbAMtzaQCvxTGThuANReoZTB/xhm+
	BxyJmfFDLt0ZTz6quFjFGe79VoQ69t+Inp72p0WcD2OwX+AnmqpHYzq6phr+CzGrPjqtVfbxzL2
	okjo0qEG6HRyPMmSe5Y/VRcBsgc9eG/pAOV2QtvH3GLHmBCHXJ5tcNLvJMchyW97vhsSOOS87jQ
	CIrj9Qj+VJHBsRSZANynxhveqtPtAmCtTABIH+5K9CBZCbS7AI8dVC7VdxNBxZf1iwybO/SIqos
X-Received: by 2002:a05:7022:eb46:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-190a61447a2mr3916698c88.34.1792606619346;
        Wed, 21 Oct 2026 11:16:59 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1903a180b9esm12244049c88.4.2026.10.21.11.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:16:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:16:56 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/18] nvme: Implement cross-controller reset
 completion
Message-ID: <20261021181656.GV2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-10-mkhalfella@purestorage.com>
 <207f5a00-7fee-4ea5-b541-38424d4766bd@flourine.local>
 <20261021010438.GR2931-mkhalfella@purestorage.com>
 <02c2a904-2264-46b8-b49f-6f7109913da6@flourine.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c2a904-2264-46b8-b49f-6f7109913da6@flourine.local>

On Wed 2026-10-21 10:43:03 +0200, Daniel Wagner wrote:
> On Tue, Oct 20, 2026 at 06:04:38PM -0700, Mohamed Khalfella wrote:
> > > What happens to the waiters on sctrl->ccr_list when the source
> > > controller enters error recovery while a CCR is pending?
> > 
> > You already answered it below :)
> 
> I tried to figure it out, but I'm still not sure if I really understand
> all the conditions. So bear with me.

No problem. Take your time.

> 
> > > As far as I can tell, ccr_work itself is fine. The reset path cancels
> > > it via nvme_stop_ctrl(), and in the error recovery path the Get Log
> > > Page just fails once the admin queue is torn down. But the target drops
> > > all CCRs issued by the old association when it frees the controller,
> > > so the CCR completed AEN for them will never arrive. Nothing on the
> > > host side walks ccr_list when the controller leaves LIVE, so
> > > nvme_issue_wait_ccr() sleeps until min(kato, deadline - now) runs out
> > > before nvme_fence_ctrl() tries the next source controller. In the
> > > worst case that eats the whole fencing window.
> > 
> > If the remaining of the fencing window (deadline - now) is less than
> > kato then I am fine with this scenario wasting this time anyway. If we
> > hit the deadline then we consider fencing done anyway. If it consumes
> > kato from the deadline then we retry another path.
> 
> Okay, this might be something worth documenting? It seems like a case we
> will get bug reports in the future.

I do not think this behavior worth documenting as stable behavior. We
should be able to refactor/change/optimize this code in the future
without worrying about breaking a documented behavior.

The main point of CCR is to speed up controller fencing in order to avoid
CQT delay. I think of it as a best-effort process attempted in a bounded
amount of time. If it succeeds we skip the CQT delay, otherwise we spend
the time we will have spent in CQT delay anyway.

Can we do better within this bounded amount of time? Sure, this is what
is being suggested here. However, I prefer not to do that part of this
patchset. Also, do not like to clutter the code with comments about
potential changes.

> 
> > > Would it make sense to fail all pending entries (set ccrs to a failure
> > > status and complete them under ctrl->lock) when the source controller
> > > goes into error recovery, so the fencing code can move on to another
> > > path right away?
> > 
> > Failing pending CCR entries that we know we are not going to complete
> > will help in this case. The question is where to do that. A LIVE
> > controller might hit an error and transition to FENCING, or manually 
> > reset and move to RESETTING, or deleted and go to DELETING. Do we need
> > to consider all these places to fail the pending CCRs?
> 
> I'd say yes. Anyway, I don't think this needs to be addressed right away
> if the current code is functional correct and we are just not as fast as
> possible. 

Agree, the goal of the patchset is to add the initial support for
CCR/CQT. If there are functional issues they should be addressed now.
Known gaps and optimizations can come in later patchsets.

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ca7f083702f5..6c0703fba8ff 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -863,6 +863,9 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
                wake_up_all(&ctrl->state_wq);
        }

+       if (changed && old_state == NVME_CTRL_LIVE)
+               nvme_fail_pending_ccrs(ctrl); /* TBD */
+
        spin_unlock_irqrestore(&ctrl->lock, flags);
        if (!changed)
                return false;

One way to fail pending CCRs is to add it to controller state machine.
Something like the diff above.

> 
> > You might have also noticed that nvme_issue_wait_ccr() calling
> > __nvme_submit_sync_cmd() might consume the entire fencing window if the
> > CCR command gets held because the source controller hits an error. This
> > is another area be optimized. I am inclined to leave the code as it is
> > today. What is being described here is an optimization that can come
> > later on.
> 
> Yes, I was actually about to ask about __nvme_submit_sync_cmd in this
> path next. Since my questions are about optimization, I don't think we
> should make the current version any more complex than it already is. We
> can handle optimization later, but please document those cases in the
> meantime.

Hannes also raised this point. It is on my todo list to add timeout
parameter to __nvme_submit_sync_cmd() and use that here.
