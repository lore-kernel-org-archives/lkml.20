Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE853D3D11
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929266; cv=none; b=I4pmbbJ1hP1QTAo3DOjXWfC0QUc4hXRi6KzncAk5oI8opMn1P50BNT2Pn65v5zgxlHsy9eMp0746WzwV6YfRvxgVbUK5ClLAEPyO2P52IpuiXnpljTCmkZ/YqLm2YX+5e4cYqncFVHZZPzVx49HmpafWprDc0ra54XonNCQlWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929266; c=relaxed/simple;
	bh=nCFjr12lNLmaMC8A2LB8AbbfnshOjhNgC+DQ8X5jJ0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2wnbJvCZOcM59CGOGF44MT9rH6SY9hbQRw46vfAMcp+mxUwJ5oGqZqOR6MMaHJ8Tod2OPFno9H8QOsHRW/EB3nfO0XYmC6D+CEVV49Tgr//FVNldWjRsmU5hBfY3wrHCKrYlT4OHDs5ktqhcftio+2Cl4Yj8xpmRSy/YPyzEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BwZGYXbc; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BwZGYXbc"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1889109a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929263; x=1790534063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EcxAKjEfH2MK0I8aTIhf1/PJHO0akVhMcP4QQf38ues=;
        b=BwZGYXbc032EnAukVxQja+OsaZOzRQ2jkLJ7wzoV2A9xoiN5KWXnqSWJZh/xWGWhR/
         nhc7x9t9zfnKIzfiU6Rrh+AIcqKkvA551uw9lsUn1nsT2V5wzpfTyYv0KFCMtxeawrzV
         mxJ0pv/nlH4DPuktsgPH5KBxcdMYXF7uEb+noxwPn5xHNDs/aofb6GnsEHvo57fXtd5i
         cZKmaXK6UPrCNaRQ4tXshEmBGXsJjeeRD2HnNFgCPdcGJYGGGt6NLKHWbv6ejzLjzNEC
         VW3578ppFd2bvhcPjrTBNSf68WzEOdH1XA/wdhDk92ab34ZbeXkbceyvk8u/cemFQD0n
         gsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929263; x=1790534063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcxAKjEfH2MK0I8aTIhf1/PJHO0akVhMcP4QQf38ues=;
        b=KCM9c61BWhf9FaxLLQz5HcwChYUIyWUf/nI2TimSC10yuAJOOq1l2HDl0skntf/+l/
         FfP04+jsknTQOWk6WCzJ4Bz/y/ILkWJDeCfuFe6AkTp1mkrK93EZUNXAdgW6irtyFiUI
         YW+74tcrXQFITQcXFziIRxUuf6DgrvKjVt6O51bL5S+1aky7IQPeR8gwlnsvHL+TKIKO
         aRo78IqYl3VQWQ/5Md98pSe/ENZq5FA2dvea719BJ/Hek0JWSY/mrFrgNtjKru5HXsWL
         M9aRvyB1/ZlHxrQ1O1qNXWl2FZd+7y97g7USwbKUETlm/xksBXs6F6XJ1G/S0zIzhHK7
         xvlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiJ2jJMPJP2VUEcwJ3LXl4Fmq5K7F0GyUm5QSeELPXOsKo+RGy8/7uVXgdiAbNT1gFANmODUOHmm4jO9k=@vger.kernel.org
X-Gm-Message-State: AFuF++kEZ+Fmk0E2wVwI7/iwXMzjnFc131c3geDJwxtRKS/JcqKYcEQQ
	tvynDXA8i7MIPT0wfz1N+kDqxpax786Soin1qhqJUZNUtyPSf7sjJnuEsJepi12i4mw=
X-Gm-Gg: AYBFou3VxbXU3fx86TYbD0AHHkCCgpKOApigv4hPqe9t9AmPscqQa2ZfdKNCdkE/Rxd
	AAKQaQwMSrs/1z5fJJRvCFwENs4lajW9jcpvlqyV4xabBY3/K8IQnfB6y0ft4eYpmSraEcRPNz0
	B3FmHT70qPrGcx+q2PQprPQ4NRukL7qqmvjASrQvrJmg4C9PT0jCRbsTEBRWLHmexO7MuPPD2Et
	bYAjiaFnMYHaw/Y8CtZxWCx8ziH7rwDOk7S3OhmLAwwkjCmD3xIGmqDcglcWbaIjqaLTFXmTnE/
	w7kQdGHwcJh6XCtw43e1zE0jleTlMrZL4Vzv6Fcmm8udfS7SNovr/ZGVuT6nOJm+rMuo1kdece/
	GbI8zy1zfpsTQV/npKIy4aYoThdhtHY9uvOhMP2pouIOJfGKTZhq6CRFYlnJUn0nkwza7HSH2H1
	zhGTWh7v4Wf3iWWdkrm6vhbtTzv1MJu8KfstTRH/oln2RYGu0WpKeVpoMyRaOjAFXTp0Q2wO/Wj
	yQEBA==
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr9278168637.40.1789929263026;
        Sun, 20 Sep 2026 11:34:23 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm13071254eec.12.2026.09.20.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:34:22 -0700 (PDT)
Date: Sun, 20 Sep 2026 11:34:20 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] TP8028 Rapid Path Failure Recovery
Message-ID: <20260920183420.GH5552-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>

On Fri 2026-09-18 11:14:00 -0700, Mohamed Khalfella wrote:
> This patchset adds support for TP8028 Rapid Path Failure Recovery for
> both the nvme target and initiator. Rapid Path Failure Recovery brings
> Cross-Controller Reset (CCR) functionality to nvme. This allows an nvme
> host to send an nvme command to a source nvme controller to reset the
> impacted nvme controller, provided that both source and impacted
> controllers are in the same nvme subsystem.
> 
> The main use of CCR is when one path to the nvme subsystem fails.
> Inflight IOs on the impacted nvme controller need to be terminated
> first before they can be retried on another path. Otherwise, data
> corruption may happen. CCR provides a quick way to terminate these IOs
> on the unreachable nvme controller, allowing recovery to move quickly
> and avoid unnecessary delays. In case CCR is not possible, inflight
> requests are held for a duration defined by TP4129 KATO Corrections
> and Clarifications before they are allowed to be retried.
> 
> On the target side:
> 
> * New struct members have been added to support CCR. struct
>   nvme_id_ctrl has been updated with CIU (Controller Instance
>   Uniquifier), CIRN (Controller Instance Random Number), and CQT
>   (Command Quiesce Time). The combination of CIU, CNTLID, and CIRN is
>   used to identify the impacted controller in the CCR command.
> 
> * The CCR nvme command implemented on the target causes the impacted
>   controller to fail and drop its connections to the host.
> 
> * The CCR log page contains the status of pending CCR requests. An
>   entry is added to the log page after a CCR request is validated.
>   Completed CCR requests are removed from the log page when the
>   controller becomes ready or when requested in the Get Log Page
>   command.
> 
> * An AEN is sent when a CCR completes to let the host know that it is
>   safe to retry inflight requests.
> 
> On the host side:
> 
> * CIU, CIRN, and CQT have been added to struct nvme_ctrl. CIU and CIRN
>   have been added to sysfs to make the values visible to the user. CIU
>   and CIRN can be used to construct and manually send admin-passthru
>   CCR commands.
> 
> * New controller states FENCING and FENCED have been added to make
>   sure that inflight requests do not get canceled if they time out
>   during the fencing process. FENCED exists so that the controller
>   state machine does not have a transition from FENCING to RESETTING.
>   Instead, FENCING -> FENCED -> RESETTING. This prevents a controller
>   being fenced from getting reset. Only after fencing finishes is the
>   impacted controller reset.
> 
> * Controller recovery in nvme_fence_ctrl() is invoked when a LIVE
>   controller hits an error or when a request times out. CCR is
>   attempted first to reset the impacted controller. If it fails,
>   inflight requests are held until it is safe to retry them.
> 
> * Updated the nvme fabric transports nvme-tcp, nvme-rdma, and nvme-fc
>   to use CCR recovery.
> 
> * Controller deletion now waits for an active fencing window to end
>   instead of failing, so a sysfs disconnect, rdma device removal, or
>   module unload during fencing no longer drops the deletion or leaks
>   the controller.
> 
> Ideally, all inflight requests should be held during controller
> recovery and only retried after recovery is done. However, there are
> known situations where that is not the case in this implementation.
> These gaps will be addressed in future patches:
> 
> * A manual controller reset from sysfs of a LIVE controller will
>   result in the controller going to the RESETTING state and all
>   inflight requests being canceled immediately, and they may be
>   retried on another path. A reset issued during a fencing window is
>   rejected by the state machine.
> 
> * A manual controller delete from sysfs of a LIVE controller will also
>   result in all inflight requests being canceled immediately, and they
>   may be retried on another path. A delete issued during a fencing
>   window now waits for fencing to end instead of being dropped.
> 
> * In nvme-fc, the nvme controller will be deleted if the remote port
>   disappears with no timeout specified. For a LIVE controller this
>   still results in immediate cancellation of requests that may be
>   retried on another path. If the controller is already fencing, the
>   association is torn down without completing the held requests and
>   they are only allowed to fail over once fencing ends.
> 
> * In nvme-rdma, if the HCA is removed, all nvme controllers will be
>   deleted. Deleting LIVE controllers still cancels inflight IOs, and
>   they may be retried on another path. Controllers in a fencing window
>   are now deleted only after fencing ends.
> 
> Changes from v5:
> 
> - nvme: Introduce FENCING and FENCED controller states
>   - Treat FENCING/FENCED controllers as available paths in
>     nvme_available_path() so a multipath head does not fail all IO
>     while its last path is being fenced
> 
> - nvme-fc: Refactor IO error recovery
>   - Split into two patches, "nvme-fc: start error recovery instead of
>     aborting timed out IOs" and "nvme-fc: perform error recovery
>     directly from ioerr_work"
>   - nvme_fc_start_ioerr_recovery() queues ioerr_work directly in
>     DELETING/DELETING_NOIO so that a dead target does not hang
>     controller deletion
>   - nvme_fc_ctrl_ioerr_work() claims RESETTING before tearing the
>     association down and skips recovery when another state owns it
>   - nvme_fc_reset_ctrl_work() tears the association down before
>     nvme_stop_ctrl() so that flushing ana_work or fw_act_work does not
>     get stuck waiting on IOs that never complete
> 
> - nvme-fc: Use CCR to recover controller that hits an error
>   - Tear the association down at the start of fencing_work, releasing
>     all LLDD resources as soon as the controller enters FENCING. This
>     fixes a use-after-free followed by a panic when the LLDD is
>     unloaded or shut down (e.g. lpfc during kexec) while a fencing
>     window is running: the LLDD's bounded unload waits expire before
>     the fence does, its resources are freed, and the post-fence
>     remoteport_delete upcall lands on freed memory
>   - Stop keep-alive and cancel async_event_work before the teardown.
>     AER submission bypasses blk-mq and must not reach the LLDD after
>     the hw queues are deleted. cancel_work_sync() is used instead of
>     flush_work() because fencing_work runs on nvme_wq, the same
>     rescuer-equipped workqueue async_event_work is queued on
> 
> - nvme-fc: Hold inflight requests while in FENCING state
>   - Split nvme_fc_delete_association() into
>     __nvme_fc_teardown_association() and
>     nvme_fc_flush_held_requests(). fencing_work now runs only the
>     teardown at fence start and the held requests are completed on the
>     FENCING -> FENCED transition, so they can fail over only after CCR
>     succeeds or time-based recovery ends
>   - Complete the held requests while still in FENCING, before moving
>     to FENCED, so an io timeout cannot claim FENCED -> RESETTING and
>     start reconnecting while the flush is running
> 
> - nvme: Add support for CQT to nvme host
>   - nvme-fc: complete the held requests in fenced_work when time-based
>     recovery finishes, matching fencing_work
>   - Dropped the Reviewed-by tags due to the above change
> 
> - New patch "nvme: let controller deletion wait out a fencing window"
>   - DELETING is not reachable from FENCING or FENCED, so during a
>     fencing window nvme_delete_ctrl() fails with -EBUSY and its
>     callers silently lose the deletion: a sysfs disconnect is dropped,
>     rdma device removal returns early, and module unload leaks live
>     controllers. Add nvme_delete_ctrl_wait(), use it in the tcp/rdma
>     module exit paths and rdma device removal, and make
>     nvme_delete_ctrl_sync() wait the same way
> 
> v5: https://lore.kernel.org/all/20260712022437.3743117-1-mkhalfella@purestorage.com/
> 
> 
> Mohamed Khalfella (18):
>   nvmet: Rapid Path Failure Recovery set controller identify fields
>   nvmet/debugfs: Export controller CIU and CIRN via debugfs
>   nvmet: Implement CCR nvme command
>   nvmet: Implement CCR logpage
>   nvmet: Send an AEN on CCR completion
>   nvme: Rapid Path Failure Recovery read controller identify fields
>   nvme: Introduce FENCING and FENCED controller states
>   nvme: Implement cross-controller reset recovery
>   nvme: Implement cross-controller reset completion
>   nvme-tcp: Use CCR to recover controller that hits an error
>   nvme-rdma: Use CCR to recover controller that hits an error
>   nvme-fc: start error recovery instead of aborting timed out IOs
>   nvme-fc: perform error recovery directly from ioerr_work
>   nvme-fc: Use CCR to recover controller that hits an error
>   nvme-fc: Hold inflight requests while in FENCING state
>   nvmet: Add support for CQT to nvme target
>   nvme: Add support for CQT to nvme host
>   nvme: let controller deletion wait out a fencing window
> 
>  drivers/nvme/host/constants.c   |   1 +
>  drivers/nvme/host/core.c        | 275 +++++++++++++++++++++++++-
>  drivers/nvme/host/fc.c          | 333 +++++++++++++++++++++++++-------
>  drivers/nvme/host/multipath.c   |   2 +
>  drivers/nvme/host/nvme.h        |  27 +++
>  drivers/nvme/host/rdma.c        |  61 +++++-
>  drivers/nvme/host/sysfs.c       |  27 +++
>  drivers/nvme/host/tcp.c         |  59 +++++-
>  drivers/nvme/target/admin-cmd.c | 126 ++++++++++++
>  drivers/nvme/target/configfs.c  |  36 ++++
>  drivers/nvme/target/core.c      | 115 ++++++++++-
>  drivers/nvme/target/debugfs.c   |  21 ++
>  drivers/nvme/target/nvmet.h     |  20 +-
>  include/linux/nvme.h            |  70 ++++++-
>  14 files changed, 1083 insertions(+), 90 deletions(-)
> 
> 
> base-commit: fd9beb8870736e1c6a0b2351d88a161aaeb2b326
> -- 
> 2.55.0
> 

Oops, looks like I forgot to add -v 6 to git-send-email. Resent the
patches with the correct subject.

https://lore.kernel.org/all/20260920182936.2317916-1-mkhalfella@purestorage.com/
