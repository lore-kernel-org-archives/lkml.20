Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96A41B8ED
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560992; cv=none; b=klN9y8XTgSPSUlPWz1GPHCVHOMzwP3MLPFaAq21tBFlNpSjJBIJrkvrOByMnBKBNGWiZ7VzsW4PKxhsibgF+UExzxyhizlnbEN8LBW7n40ZwEos8KX/64Z0RJGK8ludMiNsssc81XoNhUu46aiymra6T3/oKn47CGTbAFRZFf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560992; c=relaxed/simple;
	bh=7RfzlHSqYRxJx2aHywatYf0OmJcrc01hTXBGWmCG8yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVFpWvQF0ieikWlVwcYX5TuEGlmIvoxBKxTG5gHvad72jvyWcKVudDTtCClwozd0SnztawItohMLp29sZKyZs7KOfkCdmyn2CvFKaeKN8SnhlDtUGDjNwsVGZCJI7KpNGnrmgm3Fr6rKVIICdYnc/ULh6r3MybETs4ei+bcb9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CwaQEf5D; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CwaQEf5D"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1526861b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788560990; x=1789165790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l28Mnpox539s4is2ExkEzGdvcyxPfAUNIS6oNY0bXaY=;
        b=CwaQEf5Dmw5LZiPGxbgCWkfXuId9xE7mp0h0ZAETJNicmIqFEWHfIjvkNthvr5QjM6
         7pDyjLq3171gqSksDfNw7ayX15cILTeEUsEwW7uqOYvT4PaW2yKGcMk5epzQWvbAb3qx
         jvy5I/kmU4pFDpiDH3etBe7On53B/UnsPUymGkjHPiJWIDFn6wWv19Fkr1rSFD/r7ztE
         BrfYqTVJT12KlJ+Q/VJQaMuhDylanoQr5F3kMsXXvK68gGk/WWTVJUy6K1RPxOR+vp8i
         zyV3A7MbCQ+zEenLlh/5ee8rePrqUfW8Plms4Saj9+mhm2VUXN1bMxngdcyEjtVj54TY
         VAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560990; x=1789165790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l28Mnpox539s4is2ExkEzGdvcyxPfAUNIS6oNY0bXaY=;
        b=n85dXGbRRr08JN3MzImpcJ1nThmDmAAf1wAMfM617s1fMwD7xwomQ2wH92zxbTVapk
         J0yc1khsOVnapgzE2oPImhgzj02ycD5b17czGKxuZqTnjyTtu3M/EDgkjG8q1Ey9kEfv
         5k4xfE3LEyiK5P5KNAgxI0kX57b+MpcTZMgvQLzsMwPAB072y/mUSQbly8lDSrloHPD8
         xmX2haG7GNjPCcZS2WHclgKz5hfNOTRXySGiYwE5Pv7Jc1L3goSS53Q3SJF8JWqeOCMi
         sJKGSd3gBGBWWqn9vH6b4g+fKxfNa0B6yJuImZumMguxDRxCttsHCcp3sSunsUrO2K68
         pGSA==
X-Forwarded-Encrypted: i=1; AKwUvBzrbP1mKDVrbB4wtZXJ/vCfgn/DB1lUOz1T0PBa0L8OeTbx7RpLn5zSlwQWwM01ruxcN1OrOWP1/mS4lqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mrU0BoOo2Cd9uS+1Su5NFr0y8Ou7s8DktkXY8fTLhGhEHpW78d
	ww9qPIl58PbKyIWXIAULgVuZia/nKJaptNScKgy8o47PFSSvaOe6svuZ1T+rRJ6jrQg=
X-Gm-Gg: AYBFou3RR0QlYtMlme2leB3WslLaL31WyA07T73z88q5Oo2ZS4BW8BcOjAspiZ0RAHr
	nozPct2xAykEuXxBtroA15hVlk7HlYr5B84RhN4bTY9souKdES6BYdmHem+tuhfvHHbmgDVp7P1
	UAOB99UzkyAzP26ARdk7x4r0j/kqrxZe/xSn0hLzG/xdhHsIxNFx+G3okgn3WpkJkO+DX23PpQj
	nUjkDROYw+vrBCEkHA6bEfpKLzEPrG/8LbQXoREhUiufCWGQkEk15pC6Mdmiv7KFxceHsw2bfQv
	WYmpBrsnmtQWB/cRBMueG6gRZ2h0GiMC4bExIWZp20jvl5LOU+yqOLz2aw6iPhMSsKm61MCTYiU
	6IEa43yOxz7SHnIx8P9yLis8+rgCY1B0qA+Ftq4J/fHGRrj94ea0sfVI3QX3l3m7+bnZj1wp4e/
	KQz9tcky8afDQDHs4abQXYBmrg1fj68MjYGrgkucOrG9+u6mjsvlv+FUkB8Ah/E2UiJ6/i5nZJQ
	Kgnxw==
X-Received: by 2002:a05:6a20:4394:b0:3d2:2afa:d7d with SMTP id adf61e73a8af0-3da3a091e07mr13501548637.18.1788560989531;
        Fri, 04 Sep 2026 15:29:49 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-143243a9388sm8934860c88.10.2026.09.04.15.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:29:48 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:29:46 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Dhaval Giani <dgiani@purestorage.com>,
	Aaron Dailey <adailey@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/16] nvme: Implement cross-controller reset
 completion
Message-ID: <20260904222946.GA5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-10-mkhalfella@purestorage.com>
 <b14ee42d-95f4-42d9-8b40-58c0f045b414@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b14ee42d-95f4-42d9-8b40-58c0f045b414@suse.de>

On Mon 2026-07-13 09:11:24 +0200, Hannes Reinecke wrote:
> On 7/12/26 4:23 AM, Mohamed Khalfella wrote:
> > An nvme source controller that issues CCR command expects to receive an
> > NVME_AER_NOTICE_CCR_COMPLETED when pending CCR succeeds or fails. Add
> > ctrl->ccr_work to read NVME_LOG_CCR logpage and wakeup threads waiting
> > on CCR completion.
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > ---
> >   drivers/nvme/host/core.c | 50 +++++++++++++++++++++++++++++++++++++++-
> >   drivers/nvme/host/nvme.h |  1 +
> >   2 files changed, 50 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index a1deffc3cc00..18de3805eff8 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -1943,7 +1943,8 @@ EXPORT_SYMBOL_GPL(nvme_set_queue_count);
> >   
> >   #define NVME_AEN_SUPPORTED \
> >   	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_FW_ACT | \
> > -	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_DISC_CHANGE)
> > +	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_CCR_COMPLETE | \
> > +	 NVME_AEN_CFG_DISC_CHANGE)
> >   
> >   static void nvme_enable_aen(struct nvme_ctrl *ctrl)
> >   {
> > @@ -4974,6 +4975,48 @@ static void nvme_get_fw_slot_info(struct nvme_ctrl *ctrl)
> >   	kfree(log);
> >   }
> >   
> > +static void nvme_ccr_work(struct work_struct *work)
> > +{
> > +	struct nvme_ctrl *ctrl = container_of(work, struct nvme_ctrl, ccr_work);
> > +	struct nvme_ccr_entry *ccr;
> > +	struct nvme_ccr_log_entry *entry;
> > +	struct nvme_ccr_log *log;
> > +	int num_entries, ret, i;
> > +	unsigned long flags;
> > +
> > +	log = kmalloc_obj(*log);
> > +	if (!log)
> > +		return;
> > +
> > +	ret = nvme_get_log(ctrl, 0, NVME_LOG_CCR, 0x01,
> > +			   0x00, log, sizeof(*log), 0);
> > +	if (ret)
> > +		goto out;
> > +
> > +	spin_lock_irqsave(&ctrl->lock, flags);
> > +	num_entries = min(le16_to_cpu(log->ne), NVMF_CCR_PER_PAGE);
> > +	for (i = 0; i < num_entries; i++) {
> > +		entry = &log->entries[i];
> > +		if (entry->ccrs == NVME_CCR_STATUS_IN_PROGRESS)
> > +			continue;
> > +
> > +		list_for_each_entry(ccr, &ctrl->ccr_list, list) {
> > +			struct nvme_ctrl *ictrl = ccr->ictrl;
> > +
> > +			if (ictrl->cntlid != le16_to_cpu(entry->icid) ||
> > +			    ictrl->ciu != entry->ciu)
> > +				continue;
> > +
> > +			/* Complete matching entry */
> > +			ccr->ccrs = entry->ccrs;
> > +			complete(&ccr->complete);
> 
> I _think_ we need a marker here to figure out if the completion was 
> already called. Depending on how often the log gets updated it might
> be that we're processing two AENs before the other thread in 
> nvme_issue_wait_ccr() is able to process the completion and remove the 
> element from the list, in which case we're issuing a double completion.

Yes, processing two AENs can result in double completing ccr->complete.
However, this is harmless. It causes complete->done to be incremented
twice which is not an issue.

> 
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> > +out:
> > +	kfree(log);
> > +}
> > +
> >   static void nvme_fw_act_work(struct work_struct *work)
> >   {
> >   	struct nvme_ctrl *ctrl = container_of(work,
> > @@ -5050,6 +5093,9 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
> >   	case NVME_AER_NOTICE_DISC_CHANGED:
> >   		ctrl->aen_result = result;
> >   		break;
> > +	case NVME_AER_NOTICE_CCR_COMPLETED:
> > +		queue_work(nvme_wq, &ctrl->ccr_work);
> > +		break;
> >   	default:
> >   		dev_warn(ctrl->device, "async event result %08x\n", result);
> >   	}
> > @@ -5238,6 +5284,7 @@ void nvme_stop_ctrl(struct nvme_ctrl *ctrl)
> >   	nvme_stop_failfast_work(ctrl);
> >   	flush_work(&ctrl->async_event_work);
> >   	cancel_work_sync(&ctrl->fw_act_work);
> > +	cancel_work_sync(&ctrl->ccr_work);
> 
> Might be good to have a WARN_ON(!list_empty(&ctrl->ccr_list)) here.

I do not think we are missing a case where a CCR entry can be left in
ccr_list. The only place that adds/deletes CCRs is nvme_issue_wait_ccr()
which should be running while the controller in FENCING state.

If the statement above is wrong, then there is a bug I need to fix. I
think the code should be clear such that WARN_ON() is not needed.

> 
> >   	if (ctrl->ops->stop_ctrl)
> >   		ctrl->ops->stop_ctrl(ctrl);
> >   }
> > @@ -5363,6 +5410,7 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
> >   	ctrl->quirks = quirks;
> >   	ctrl->numa_node = NUMA_NO_NODE;
> >   	INIT_WORK(&ctrl->scan_work, nvme_scan_work);
> > +	INIT_WORK(&ctrl->ccr_work, nvme_ccr_work);
> >   	INIT_WORK(&ctrl->async_event_work, nvme_async_event_work);
> >   	INIT_WORK(&ctrl->fw_act_work, nvme_fw_act_work);
> >   	INIT_WORK(&ctrl->delete_work, nvme_delete_ctrl_work);
> > diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> > index 90b989302e21..578fedda9946 100644
> > --- a/drivers/nvme/host/nvme.h
> > +++ b/drivers/nvme/host/nvme.h
> > @@ -422,6 +422,7 @@ struct nvme_ctrl {
> >   	struct nvme_effects_log *effects;
> >   	struct xarray cels;
> >   	struct work_struct scan_work;
> > +	struct work_struct ccr_work;
> >   	struct work_struct async_event_work;
> >   	struct delayed_work ka_work;
> >   	struct delayed_work failfast_work;
> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
