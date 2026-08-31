Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B253A9630
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214093; cv=none; b=VHdVaxKD5kJH7z317YztwKmPLAvp1D2H4LISLSf4m5azmjKbhL1AEG1QQm+ohF6CI7cF7aN91GYXBG7mnDtqCbb3qiSvMYiKkKOr4xe/ldv08Y0pc+3QAyjfQBEClJzOWASN91MzxlFN1XyGkzrVXF5Ws+okhUng5BKaIEmo6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214093; c=relaxed/simple;
	bh=2pMzS8f5kjRtiJoED0kosQajBLLEmWHVVXexcVX+n+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2+seaiqQtVf1or08ZqcSr+cb+c4HQQpJTdeKiDSWX9zjn4ajvXLegoOxVfQXSwoePALFKCKk0AFWLM4is+TsYBkydbm5efXtLDLn4Kqv6DJ4h1mXofTUa+SViCpI1ClupjDYJ31VTvoDCqI+eV01dmWe0snV9SCjwVj/KklaR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=alN8mP59; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="alN8mP59"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f421638271so520550a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788214090; x=1788818890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVaP7reUlLXYTaWyms8a2Quq5+138mi3Pm6IDfj0Unw=;
        b=alN8mP59b0dxwPsi8FjNZQr6gPCzpiecV50/pTTkaUc8ZxSGfhtjrq4p4k6+6Kj0QJ
         uSC/Ml2WLBvWSIaQE6IXecIXw5yPAn/ArfNlzndJOeZQ82oXSL5MAWoMgl7RaQg7XZdK
         5nWTG2fURFXH6x3e4VCWIva6SqSGJ9g/r/erskGHuzZQnl5PlYH6TiIvwNhyxCVyRCBl
         rJwqLfO1hQiLEVdQ8GO7ZjA+lgxc5AQ+QC9P6kFcXnCRv4+VrnpPyor5VQbKPugwMgYS
         YeVQsWuVhRlX402+ngweZvXxq+zvnmWn//dDNPMV+IE4bIwcyAkrvuqGIIHDRvYBBZxu
         KJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214090; x=1788818890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVaP7reUlLXYTaWyms8a2Quq5+138mi3Pm6IDfj0Unw=;
        b=cHy3odW4L3e8JHdGk+4SDn7LaGPdUuXITt7GTwEmn2auFkQ5MEz+jdHGwfE6k7tlP4
         DEhULjD7yAmfwmgC2fScgdDTOrjM+8B+0/eIUzwDe1rSZbLq29oXC/bibQ4ryguGhza2
         glKb38gzAu4NnjApmkhaKf9UeOSfv34QIPsYpAE4PVlR0nWB11qKjMG+4xG2y5oKYwgO
         Bo2dbUB8fhnLmhhDZ+ZBN6pJzgklN6JNI9ZFFq/V2WGliZgJS6+AYEtnqqtEjDcBcOQV
         4gYTXSrH6s56tclKY3SQgA1dtL+5XaY4l61h/UO3fpJGMtR9nl7V869ESi1nVzx+jrb9
         LTbg==
X-Forwarded-Encrypted: i=1; AHgh+RrhjLMOrmNeP8YBibz4gngBtYKlkkP9Rj7nX5dwuAlReLyvSNoMGYVsp49sIvvwbSLw3uwXEPAgYRtoDG4=@vger.kernel.org
X-Gm-Message-State: AFuF++kKKbjjVx41KHk4pu6SQq1eEPox1/rm6PrkPSva8CtrgeLtM590
	gbjeay7KHYN+9oZrdaVgsAXM4+fyjoQto4xA0C7JwB6GnyqI0rdcfTvNDZ4YpyNa4ZuqONjTt9T
	C+Fhi
X-Gm-Gg: AR+sD12K9i1G+9VAEm+fNhZ96j+Ni1b71+VjokufcaTvxZenvB1KzgTyaC3zqge+YKb
	d2flIwoKbGGro12H+Ue26uDIkAx0s7gCzJUo8WL+pf89S5b7Zk9faI4ZMDmDwJ9j5a5hHkvZMfl
	zH1IOomO2WKEDy7POPhO+53llhPDQm/OIESrGmL86X1RnP/bexd5qDCmhmf+y5ZtQ3RmFGJPwyu
	KScMBPiayKKBOjQ8OS/2HGFNfFCHIO/pqjiouotM9nSkBrIkwsKOtV4WqAuc38rPu13W04Vmltr
	gEr4F88Evjy0poPDYpPVk9jXm2j5919oV0aBJ/FLrx7/GmY4w3l/Sbgl6IbxHPR2US8SPIRc8Os
	u34Fab3763q8YMWnAhWu5Sy8cQeindEgr+m8Oa7lw8SePROIdPIDx/OsDOzSc8t7nIQMb1y4vSh
	M+p6zP9Apt4wwbCUZro9AKxvYrCF0FpnGAvWhOLPJAoTUdvwnyNRKi9njH/xyk3RgvN5P12v4ri
	sBmHPTbnnVBmc1G4g==
X-Received: by 2002:a05:6830:6617:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7f4f1f8a280mr18603246a34.0.1788214090149;
        Mon, 31 Aug 2026 15:08:10 -0700 (PDT)
Received: from dev-cachen2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7f4fa7ec582sm9294828a34.9.2026.08.31.15.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:08:09 -0700 (PDT)
From: Casey Chen <cachen@purestorage.com>
To: sagi@grimberg.me
Cc: leon@kernel.org,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	axboe@kernel.dk,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-rdma: fix ib_device removal race that hangs PCI unbind
Date: Mon, 31 Aug 2026 16:07:54 -0600
Message-Id: <20260831220754.1714514-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1ad637b8-3727-4d60-9086-b213e61ae872@grimberg.me>
References: <20260806211822.317074-1-cachen@purestorage.com> <20260828232436.270184-1-cachen@purestorage.com> <0d9ea3ed-b164-4f99-8484-87041ddffaa6@grimberg.me> <1ad637b8-3727-4d60-9086-b213e61ae872@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 31/08/2026 0:15, Sagi Grimberg wrote:
> Why not instead of this, simply do in nvme_rdma_setup_ctrl:
>
> +       if (nvme_rdma_device_dying(ctrl->device->dev)) {
> +               nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_DELETING);
> +               goto destroy_io;
> +       }
> +
>          nvme_start_ctrl(&ctrl->ctrl);
>          return 0;

I like that this reuses the existing error path, but I do not think it
closes the race. nvme_rdma_setup_ctrl() returns before
nvme_rdma_create_ctrl() takes nvme_rdma_ctrl_mutex and publishes, so the
test and the publish are not atomic with respect to the walk:

  Thread A (connect)                  Thread B (nvme_rdma_remove_one)
  ----------------------------------  ----------------------------------
  nvme_rdma_setup_ctrl()
    admin + IO queues up, LIVE
    device_dying() -> false
                                      mark device
                                      lock nvme_rdma_ctrl_mutex
                                      walk nvme_rdma_ctrl_list  (A absent)
                                      unlock
                                      flush_workqueue()
    nvme_start_ctrl()
    return 0
  nvme_rdma_create_ctrl()
    lock nvme_rdma_ctrl_mutex
    list_add_tail(&ctrl->list, ...)   <-- published after the walk
    unlock

A's controller is now on nvme_rdma_ctrl_list, nvme_rdma_remove_one() has
already finished and will not run again for this device, so nothing ever
deletes it. Its rdma_cm_ids keep the cma_device reference and
cma_remove_one() waits on it forever - the hang this patch is fixing.

> I cannot see why this additional list with a dedicated struct is needed?

Only to give that test state it may legally read. It has to run under
nvme_rdma_ctrl_mutex, and ->dying is guarded by device_list_mutex -
reading it there is what Leon objected to in v1:

  "The write to ->dying is protected by &device_list_mutex, whereas this
   path relies on &nvme_rdma_ctrl_mutex."

So the list is simply "which ib_devices are being removed", keyed on the
ib_device and guarded by nvme_rdma_ctrl_mutex. To be clear, it is not
what Leon suggested - he proposed moving the ndev off device_list, which
removes ->dying from nvme_rdma_find_get_device() but not from the
publish path, and he said as much ("at least in this path").

The list is not the only way to get that. Alternatives, in increasing
order of how much I like them:

1. A second bool on nvme_rdma_device, guarded by nvme_rdma_ctrl_mutex
   and set in the same section as the walk. Drops the list and the
   struct. Needs nvme_rdma_remove_one() to hold nvme_rdma_dev_get()
   across the callback so every racing connect tests the same ndev.

2. Read ->dying under device_list_mutex nested inside
   nvme_rdma_ctrl_mutex. One flag, no list. I would rather not:
   nvme_rdma_remove_one() already takes those two locks in the opposite
   order (sequentially, not nested), so this plants an ABBA trap for
   whoever tightens that function next.

3. Use client_data as a per-ib_device liveness token: an ->add that does
   ib_set_client_data(ib_device, &nvme_rdma_ib_client, ib_device),
   nvme_rdma_remove_one() clearing it first thing, and both
   nvme_rdma_find_get_device() and nvme_rdma_create_ctrl() testing
   ib_get_client_data() == NULL. No flag, no list, no struct, no pin,
   nothing to reset on re-probe, and ->add cannot fail because the token
   needs no allocation.

(3) also closes a window none of the others do, and which v2 leaves open
by its own admission: once nvme_rdma_remove_one() has returned, ->dying
is gone with the freed ndev, and a connect arriving before
cma_remove_one() unlinks the cma_device can still strand a controller.
remove_client_context() erases client_data after ->remove returns, so
the token stays NULL and that path is refused too.

The catch is that ib_get_client_data()'s kernel-doc says it "can only be
called while the client is registered to the device, once the ib_client
remove() callback returns this cannot be called", and (3) calls it
precisely to detect that state. It works - it is a bare xa_load() and
xa_erase() runs after ->remove - but it is outside what the API
documents. Leon, do you have an opinion on whether that is acceptable,
or whether ib_core should grow something explicit for it?

v3 follows doing (3). It is smaller than v2 (+29, no deletions) and
drops ->dying, the list and the struct, so it should address both of
your comments and Leon's. If the client_data use is not acceptable I
will respin as (1), which keeps everything inside nvme_rdma at the cost
of one bool and a kref held across the callback.

Two side effects of adding ->add that are worth naming:

 - A device with !kverbs_provider never gets ->add at all
   (add_client_context() returns early), so nvme_rdma now refuses it in
   nvme_rdma_find_get_device() rather than failing later when the QP is
   created. nvme_rdma cannot use such a device either way.

 - Clients are added FIFO, and rdma_cm registers before nvme_rdma, so
   during ib_register_device() cma_add_one() runs before
   nvme_rdma_add_one(). A connect resolving in that gap is refused with
   -ECONNREFUSED until ->add has run. It is self correcting on retry,
   but it is a real transient at probe time.
