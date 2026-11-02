Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580304;
	b=spynqTfbM96lcKJfPaaeE8hP2AzeO2MGgOvz2omPrn0r+VqOQ5T+GbW7zCXmJxI3lGu5
	 Afr+DqYGr+Qkk2aygAL95UCkFWqjxYJ8PNQInEdRt8pf5GMNlUnNHGXlrpGK8SjfXgxJA
	 qGCGfPu0RM5DN89lFz5t7Jm3VCe9km0mrvPIeYuAhVtOrCKAyxgUhkAPN/qcTAXgdtjZa
	 v6AQeXKio2GoG7qVPcBs11338+IQEkdHyBAu9lltfBnfgRlRGAeMhvdjNcgU6vYMlekRK
	 zOKpUzC9c3WrONnoBaWLVquoFGDgdUqepSSP9zJtRCYKxpoFX3tSXEsZZ+WklJ0y0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KgTB+cignjVRgjQLxHLa4kjWTCIUS/wqnaBRjGnD9Jk=;
	b=lClSLIt5HiDXhJPxZAEk6TdVzDmG8B8+0HooZwy82ovWgQfma251pEO7ZHh7tOOP9wxB
	 UYW0ZWpcaOrf6L6oAvS/DVsiJOYPz6PO25Z+I2or9fUHxERVecCA1Ka5CtRTjtSD0fcc0
	 gUoydjB0Qyxt6Ogd1yvXymgt3wAWdgYpI7EodJX0EM55ntfIxsO1cmU+1nMvjjpzkoIDV
	 ddK/1cJQe+Wlpwjq+r10pFmu7TzwPCYIPTvu6r84XaCA3AVET+ZkStSv5BsVi4C1yutu7
	 QWmcxKF+VtS9K8qfgog4V75Yxgnp1LVsXCNQU1t+0B+rCLTHgslKQtrmMGXV+XjROVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5mVdzUs;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DFC606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DFC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5mVdzUs
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so5020116eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793580303; x=1794185103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgTB+cignjVRgjQLxHLa4kjWTCIUS/wqnaBRjGnD9Jk=;
        b=e5mVdzUszWOQ1k0lfWiGZN7UQZO2C5j4Zqn2HgMmKnJtlhdYoUScQCeZLmwWj19Aup
         gdhy1ssuu6zwdYQAz5L8tv/KohMt73cBmyyYXMT1pomVW+rdbFxX7c4gMCzSfIx9Jc7l
         Y1uw+njWLWcD+glz55kQJG3lhKa9KHWZaUSJt4Jja5tUMEDcWc08/kjzwZAvpud6115H
         2PlePqxdytxVNYbtyRqGcK5iCviblwUV7L2evOA6kCovO0yzAOB6BzEDbf1yZe28BCor
         UHTatKhOqQE7ZBpqGunC9DOVBv19w6JyYMvvmiHkXIzBQCvfFr1KPeUozIyFDHhsLw5h
         zitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580303; x=1794185103;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgTB+cignjVRgjQLxHLa4kjWTCIUS/wqnaBRjGnD9Jk=;
        b=wpwZuVIMDJmuZK6MJ2HgYvm2mcsCUNNd5OTAfMzMPHA+TujB1yjzoQL3WioKI8gKpM
         g78Xydr5UGycUJ4CKOjssCDiT7W7PxphLk5xl0i0izhGtj3YtM0Sca+VoSmifFZj7mfk
         /TMoU6l5VBMs/eOs4lmJKTYufG1wK2w/McENJMLQ0KrHDb1dIxd6a+FR6p9EvU9TXW7m
         h16qlTdzMMFqbq1pwcQZ18ri/q4ngo5AaRKGPNeOe2mosqHrUQfNGUxqIOPZYm2pPDu7
         C5inpWjRcuDu+V46FBiMmgQ+l531qN6XVlYMszNaOKQPRpsGoyeDnocp4frpkWrKYN7q
         kizQ==
X-Forwarded-Encrypted: i=1; AKwUvByCj+WbNwORxU/GJ4OtgjMBRgvoSumnop2hj6aUENS4pT9TwvgLu0GtTDrQ6RaJHLID1g+KlUQChEQdsSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZz/GA5G0b5d33w0vE0EDN9U22eAEUIms5bs5o80VvWc1GaphZ
	pW5CCIocT+SCWdRpQtC3FUApw45LRuR01H+DrkrGPVEFMN70WA+S90Hk
X-Gm-Gg: AYBFou0plbR4OoFsruUQkHXQCLCyfO0erKJ30J374XXl0maEKPHH5ObGR7gpy8kE4Rm
	Nk+5leG19RSoIdsQ7buxN+XUeQdzhKPR5pz2COrBZeWXJD4BR4U4ubsU42rZuw40TwsK+rKDK8o
	LpwtYfOAhXI3w8tErvIivWHMrT93gQoZv/APoz566nyX4qz/O2DsYRAay3XcOYSclnarEMpTdTe
	h7YfvLCRwXE1b+3v95QV4he6gvMB7UUcxk5Qo9YAIUmuq65KMRYtzACSAw6ptzQwxsmuntvdrI1
	DRdHoco1GAYtAQBQglcF1o/lhjEtSQ+RVe+4c7y2uAhUEdzHYvcDKs9fxiYjjjVrlNHG3rgS909
	bjZSG4p0D91vdf3P/dhEraBLflAcu74u/7DmlCVGyVkYtJ22M5ZhrRlJGnqgJT23UWn/HhyzFu/
	2v5wB3JqS1WcX9qJlYxhIOmYF8PhbsYbw5MhtTkjW+v32vIbTpqZCfOUWhFV4ZnUDkmIEqNI53D
	q3LpGAoEcaY7e5h9YWLs1UOqTjKlDKUQx9ZvE1L9JqKKXhzPcYzkbN90SPYTVzBQtZqIKL07uLX
	AvF1QjtLCvhZr+v6kvGDdg9UziKrNO5nTIdRrFQyRDctsnJWk3XudXfygulrPC/4sX3Jr4zt35/
	sOA==
X-Received: by 2002:a05:7022:ef07:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1ac5eea1fe9mr15602497c88.43.1793580302546;
        Sun, 01 Nov 2026 16:45:02 -0800 (PST)
Received: from [192.168.0.22] ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm49255251c88.7.2026.11.01.16.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:45:02 -0800 (PST)
Message-ID: <e11a0f9b-e703-4f83-a5e9-cb28c85aadc2@gmail.com>
Date: Mon, 2 Nov 2026 09:44:56 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: mcq: Reap aborted CQEs before returning
 from abort
Content-Language: ko
To: Peter Wang <peter.wang@mediatek.com>, bvanassche@acm.org
Cc: James.Bottomley@HansenPartnership.com, alim.akhtar@samsung.com,
 avri.altman@sandisk.com, beanhuo@micron.com, can.guo@oss.qualcomm.com,
 cw9316.lee@samsung.com, hyenc.jeong@samsung.com, j-young.choi@samsung.com,
 jeuk20.kim@samsung.com, john.garry@linux.dev, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, mkp@kernel.org, ping.gao@samsung.com,
 rafael.j.wysocki@intel.com, stanleyjhu@google.com, vamshigajjela@google.com,
 stable@vger.kernel.org
References: <20261030011321.1868029-1-jeuk20.kim@gmail.com>
 <c6c84b433923fb2c4d332dfd79875be9ebbd1681.camel@mediatek.com>
From: Jeuk Kim <jeuk20.kim@gmail.com>
In-Reply-To: <c6c84b433923fb2c4d332dfd79875be9ebbd1681.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/30/2026 5:00 PM, Peter Wang wrote:
>
> On Fri, 2026-10-30 at 10:13 +0900, Jeuk Kim wrote:
> > From: Jeuk Kim <jeuk20.kim@samsung.com>
> > 
> > ufshcd_mcq_abort() can return before the OCS_ABORTED CQE is reaped.
>
> The Initiate Cleanup procedure polls SQ_CUS until the
> MCQ_POLL_US (500000) timeout expires. So is this issue caused by
> the hardware completing the cleanup operation only after the
> timeout had already expired?
>
Hi Peter,

No, this issue can occur even when SQ cleanup completes within the timeout.

SQRTSy.CUS indicates hardware cleanup completion, but it does not
guarantee that the driver has finished processing the OCS_ABORTED CQE.

Before this patch, ufshcd_mcq_abort() could return SUCCESS before CQE
processing completed, allowing the SCSI core to retry or finish the
command.

Thanks,
Jeuk

