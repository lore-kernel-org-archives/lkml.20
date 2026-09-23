Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029C132B989;
	Wed, 23 Sep 2026 05:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142140; cv=none; b=h4AoPVzaz0usjO3RzmJlJomykJkXqKTNMqqa5iM8XXv8CCnZ6dkCPjtCJNLIRs9cEUfAFO2rCZRrzEi2YK3OjM9CS8IjvUAU8Z+Q64gTtSmHCN/qiN3pl+4kmdTojKIY0Lc4ZdD5QehPVEeqLhiSnL1uOCVCfZy2X9HPE27KDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142140; c=relaxed/simple;
	bh=/w5hv76CtOIg0aakH6ZZiozInlomNNJGvYBDChvRHnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j73DI++RflXpsgJA3wm65GJUhqSqrfCAScajuMgmvSCQZ/NLI+AK/sChl4T9J13XogjDDCs739ToHkOdE5mCnmnuOrWLZz8EZDHTxoie+AAMAaP0nZcM0xKylxG2g4/5WpAVMOTjaeZqq9r9S6wPnbWJPqTTvCkOpTs9TyzLST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KisUvEO5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KisUvEO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C31F000FF;
	Wed, 23 Sep 2026 05:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790142138;
	bh=t6gLZG08rBpU/svrvyR38HuqFVAnB1qmniMlptlcMgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KisUvEO5ig4OkrItSqQD4RyoYDjOhke25eMEIZSyzc8YfAUzO0HB2BlbxygzZ5oc5
	 Z+Y8cAeOm/gR47M3aeamKlZLWRH67bws4nGm0AoA+7DwcRDL57yu0755KiGFNBm8s0
	 h1GXxHLWsah87t34t5G7TsooAy6hNcZ/UPwPRSap7+m8zFWfOAw2ud/b/B7An2Ev2l
	 agPBCvp9/oEdcEItPaOSYgRrT4CAJNneIBHVFlko9vi/omuTipWy43+HyI9pACrqUi
	 K7mnSbrOBYxgjS/0EhcTqA7WxI3edvsWvUaWATeJ4HSNK4UlPxwmNEXkXL7rBw+UQV
	 IMlMqN3FCptdQ==
Message-ID: <ebce4bc6-b210-4e07-ab6e-25f1b2b13a8a@kernel.org>
Date: Wed, 23 Sep 2026 14:42:15 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To: Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hui Peng <benquike@gmail.com>, Niklas Cassel <cassel@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <arKETtHsac_ZwVc4@sirena.co.uk>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <arKETtHsac_ZwVc4@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 22:36, Mark Brown wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> /tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
> /tmp/next/build/drivers/ata/libata-scsi.c:3575:25: error: too many arguments to function 'ata_scsi_set_sense'
>  3575 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
>       |                         ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
>   206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *cmd,
>       |      ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    c44f095a9d176 (scsi: ata: libata: Use combined sense codes)
> 
> interacting with commit
> 
>    3bab8c7e0c6ba (ata: libata-scsi: abort multi-sector pass-through commands when multi_count is 0)
> 
> from the libata tree,  I have fixed this up with the patch below and can
> carry as needed:
> 
> From 900934c48a431c99de39a6b2976368408e7d2c83 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Tue, 22 Sep 2026 14:07:31 +0200
> Subject: [PATCH] libata: Fix up semantic conflict in ata_scsi_set_sense()
> 
> /tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
> /tmp/next/build/drivers/ata/libata-scsi.c:3575:25: error: too many arguments to function 'ata_scsi_set_sense'
>  3575 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
>       |                         ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
>   206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *cmd,
>       |      ^~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/ata/libata-scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index afc2bad677bb9..e380d1b68101a 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -3572,7 +3572,7 @@ static unsigned int ata_scsi_pass_thru(struct ata_queued_cmd *qc)
>  		unsigned int multi_count = 1 << (cdb[1] >> 5);
>  
>  		if (!dev->multi_count) {
> -			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
> +			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0);

Mark,

This should be:
			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND,
					   NO_ADDITIONAL_SENSE_INFORMATION);

Thanks!
			

>  			return 1;
>  		}
>  


-- 
Damien Le Moal
Western Digital Research
