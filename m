Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.3.219.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818748;
	b=Vlj2cJznVhcVuHjI8a3jLUbqHxg1RXjvQq5lopN4WWPIFWL2XZWrdnCMdkXf9QL78fBN
	 E1ktHyRyP7IuIkM7cOUiEO8GFYQwyfPIbLGxx34LlyODEL3bbijQnZrsnKIaN96e3MiH7
	 JXukBh2J7/8/H61ayJOu+6eVgAaKSRX6KmF5v2QHR/LNo0V3vOqqegZnrqQjvNtLhRXj+
	 4NUsgHB/Od6JPH42+J4BiqzvB83izclpxj8R6Sn57YScH22VpJABjPXWgnwcl2zfUb6XO
	 4+4qxfRIiowmEvCc0NHcX0cKJevrMfXcU9dIqVRFE4xnsQoiBaZCc8OPvt1Rt2GGtOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818748;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:DKIM-Signature:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Originating-IP:X-ClientProxiedBy:X-KSMG-AntiPhishing:
	 X-KSMG-AntiSpam-Interceptor-Info:X-KSMG-AntiSpam-Status:
	 X-KSMG-AntiVirus:X-KSMG-AntiVirus-Status:X-KSMG-KATA-Status:
	 X-KSMG-LinksScanning:X-KSMG-Message-Action:X-KSMG-Rule-ID;
	bh=Q/p5cdT16DqEKxyY/aNGzE4KrR5OZR8Sl7QoM7V26FQ=;
	b=r6cpOJwF4XtyGorZnliIA83ykgtAUkrJ0mgx9e0fyCBFZ7FgZfWOyQL0SQ74Txnf2DjT
	 Fwq2YlEr9h6jeGBxsVNjy0PfmSKZzBrT+T4QlbI3uFUDBO3tTZ4+Vqj7JaPvRlEm5caat
	 Cmk0BSW/1shM23bQbSpZXXN7+AX1meRovX/VIFcdfxkwvtoaIUgI3GfOWo/vS15iisYtE
	 TuTs6JttNvfxAlAw1gOIbCfzFqHJ+0cNgya0sm1v2CvKHPXP7rDtbvN9cws9AvMX6Lidq
	 ShP2/z5DSeicZtyYqANEWYfS5Y2gaWejLimIZ+2YGVJ4b6TITUl8Yffbd9HL4ZDsI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yadro.com;
	spf=pass smtp.mailfrom=yadro.com;
	dkim=pass header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-02 header.b=hoXJPo8C;
	dkim=pass header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=BtP272eU;
	arc=none smtp.remote-ip=195.3.219.148
Received: from mta-01.yadro.com (mta-01.yadro.com [195.3.219.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22C606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D22C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yadro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yadro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-02 header.b=hoXJPo8C;
	dkim=pass (2048-bit key, unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=BtP272eU
Received: from mta-01.yadro.com (localhost [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id ACF082000A;
	Mon, 16 Nov 2026 11:45:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-01.yadro.com ACF082000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-02;
	t=1794818736; bh=Q/p5cdT16DqEKxyY/aNGzE4KrR5OZR8Sl7QoM7V26FQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=hoXJPo8CVJqLylH5WoU5WlmZxAHKmkNlEK/TS9oKOW8GDjdr+U47aKm7jcI+taZ8g
	 QN7JtWDWe7qn2XYaku/s1iQJLo2M6uAxYGduoUmDdCEiL2Tw16yG88CnVFIc2Ue8G/
	 Pte5FDs6uWtOZn3K+tJLnsRQyMH8UgIhMJs224x2O0p0jjdbvL/rQAVS6ZD2kWMYb2
	 neivw4jNSH1zBEjl8dbKbVFk90m2ouBNUEOXlnQYyWNhcxiaram98Zme7u3Cg9aBxE
	 2uA9G9f9jcwa3vzMZvf46D+UDMzhZKOTmHC68wWBeMaGIshePl6VR/I0p65jgxVB/g
	 0yTqQp0D8eanQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1794818736; bh=Q/p5cdT16DqEKxyY/aNGzE4KrR5OZR8Sl7QoM7V26FQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=BtP272eUPW/V+k7SW5fkHLG6HCn5BFyU8Jtrpq91E3YHbUrSd+EacfzJ7QBj8iTLj
	 7pKctUP73yJYMsbQleZ10IeufJA2UzGECJnIX1Du2Y/K6E/r94iYKduvY5ouA2xf0Q
	 moQkram0a+oLV9FkRoWENqooceW3FNu7FPz8l6fYfquZpGp0AvbbcrgMCfDaZvqMRe
	 lWgM8tI40eu8bc1ifAouLoEUmKz/SYx4PMPsn2DUIx/xP3GNw15lf4q2Sj0AS5IjPF
	 ZWzyhfPK4Lx6BnQCzl3lnglDp6gp8eJzDnomdREAl4QnUnGA6CoEv8ycnXfR7BSEXp
	 Ia+B92ZkvB72A==
Received: from RTM-EXCH-06.corp.yadro.com (unknown [10.34.9.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS;
	Mon, 16 Nov 2026 11:45:35 +0300 (MSK)
Received: from yadro.com (10.34.9.247) by RTM-EXCH-06.corp.yadro.com
 (10.34.9.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:45:36 +0300
Date: Mon, 16 Nov 2026 11:45:40 +0300
From: Dmitry Bogdanov <d.bogdanov@yadro.com>
To: Mohamed Khalfella <linux-nvme-bounces@lists.infradead.org>
CC: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph
 Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Justin Tee
	<justin.tee@broadcom.com>, Naresh Gottumukkala
	<nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, Hannes
 Reinecke <hare@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, James Smart
	<jsmart833426@gmail.com>, Randy Jennings <randyj@purestorage.com>, Mohamed
 Khalfella <mkhalfella@purestorage.com>, Daniel Wagner <dwagner@suse.de>,
	<linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Hannes
 Reinecke <hare@suse.de>
Subject: Re: [PATCH v7 03/17] nvmet: Implement CCR nvme command
Message-ID: <20261116084540.GA3655@yadro.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-4-mkhalfella@purestorage.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261114030454.2836543-4-mkhalfella@purestorage.com>
X-ClientProxiedBy: RTM-EXCH-03.corp.yadro.com (10.34.9.203) To
 RTM-EXCH-06.corp.yadro.com (10.34.9.206)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/11/16 06:36:00 #28892114
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

On Fri, Nov 13, 2026 at 07:04:17PM -0800, Mohamed Khalfella wrote:
> 
> Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
> Reset) command is an nvme command issued to source controller by
> initiator to reset impacted controller. Implement CCR command for linux
> nvme target.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> ---
>  drivers/nvme/target/admin-cmd.c | 76 ++++++++++++++++++++++++++++++
>  drivers/nvme/target/core.c      | 83 +++++++++++++++++++++++++++++++++
>  drivers/nvme/target/nvmet.h     | 13 ++++++
>  include/linux/nvme.h            | 23 +++++++++
>  4 files changed, 195 insertions(+)
> 
> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> index 5710ae53eb83..3df9db454db9 100644
> --- a/drivers/nvme/target/admin-cmd.c
> +++ b/drivers/nvme/target/admin-cmd.c
> @@ -378,6 +378,7 @@ static void nvmet_get_cmd_effects_admin(struct nvmet_ctrl *ctrl,
>         log->acs[nvme_admin_get_features] =
>         log->acs[nvme_admin_async_event] =
>         log->acs[nvme_admin_keep_alive] =
> +       log->acs[nvme_admin_cross_ctrl_reset] =
>                 cpu_to_le32(NVME_CMD_EFFECTS_CSUPP);
>  }
> 
> @@ -1629,6 +1630,78 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
>         nvmet_req_complete(req, status);
>  }
> 
> +void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
> +{
> +       struct nvmet_ctrl *ictrl, *sctrl = req->sq->ctrl;
> +       struct nvme_command *cmd = req->cmd;
> +       struct nvmet_ccr *ccr, *new_ccr;
> +       int ccr_active, ccr_total;
> +       u16 cntlid, status = NVME_SC_SUCCESS;
> +
> +       if (!nvmet_check_transfer_len(req, 0))
> +               return;
> +
> +       cntlid = le16_to_cpu(cmd->ccr.icid);
> +       if (sctrl->cntlid == cntlid) {
> +               req->error_loc =
> +                       offsetof(struct nvme_cross_ctrl_reset_cmd, icid);
> +               status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
> +               goto out;
> +       }

cntlid has to be validated against the configured range of the controller
ids (subsys->cntlid_min <= cntlid <= subsys->cntlid_max).
That will allow CCR to work correctly on a distributed target.

> +
> +       /* Find and get impacted controller */
> +       ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
> +                                       cmd->ccr.ciu, cntlid,
> +                                       le64_to_cpu(cmd->ccr.cirn));
> +       if (!ictrl) {
> +               /* Immediate Reset Successful */
> +               nvmet_set_result(req, 1);
> +               status = NVME_SC_SUCCESS;
> +               goto out;
> +       }
> +
