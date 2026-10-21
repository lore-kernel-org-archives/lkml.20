Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576428;
	b=vlMDc+ADm6Y5dhKmk5Z2YdFOd8r2bHmnauWJ86ZNzndZERKAJ/E0vyc5LMQmKPKG/PVq
	 gGeo74Ji3LSpxqfqffTt/WbyRJ6DgzWOmipAyg7GB7Y1/MU/L9tU/sIAi1XUPZUkPV24U
	 FzL49kWbFQLzUsLW5i4TFwvcVWfk++4mxCj/UbvKEU/D70nqYpfYl+lnq1ab6+yleTfTI
	 L02BDgRBaC9ws0aga4lceUeo8uuCTTiQqkBAc+4qumtYHca4ACbzfk+5huJrPoJE+GxCi
	 bnetTWi16nU1V0cLkVUuGFkrnpIbFxPqIeTs+tOjuL5qkGtH/t+SzLlg90oa/wbaKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ip+TnxVMQPR+eirU2Ea4sovkq+dHLiGkFhsxVAsS/8=;
	b=ia6GpZD4QM7NkOQ8tOx+2Hag8+fbNo4/a4JrTSomm4R8x029p6VeY3sbeiqwiRCDF7zi
	 IpKaPWr1s/IjSp0RQ2Gm6Y3WXmGOqsH3v8a4G47ZvJ8NY1arDP1Xw1xWAd6aCAk6WjKr3
	 D7vrZsriTajC46lB2T5DWcloloXpMwWl5f+IBxacojMYS0T3mvsUWIQG7qzi5ZTtmvbnS
	 xGVPKMYP1o/LTve6SIuLLkrcUPlHrME7ZJ7DxnsjBamd6HAGaL71YseLvG02FVONGwaUL
	 HGQ7LbJ2t5NfxkNaTv3gD0EbxhJ/xDBte1ArsrrlCV1gfzynZrXFwqOYNANIm3qG9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=L371Wz3e;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1545C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=L371Wz3e
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1363599eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792576427; x=1793181227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ip+TnxVMQPR+eirU2Ea4sovkq+dHLiGkFhsxVAsS/8=;
        b=L371Wz3e/j+AflWt6cg7l3jd5zFxKta7MW6D33ceW7g3fQ8UwcOh23IdxI/+YPSB7Y
         h1wSRWMKQMV6fJXJiylzV2tbzNx9uAEQma7GuXNKi5IodWlIRk5w4gTJbnohigWRflo1
         mIqaV1g1dj+yU8PTJImO4JQU1u4Cb9akSPLfldu8k8bzu1yZe7+C/2kPl0BQoqyt/dIC
         Px1Ppqb/uj19e/oTFiAoK1S6eTAIwqW7b/LTDE4mxA7NklIHd2yesfFHemo/JXd5hPJe
         Xf1KkH8e5k7O2S9avKrOrEQXemwQWNHH+yWaoLJf0Pr99wnVKVDlbGBskSSSWhHmkEBT
         rt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576427; x=1793181227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ip+TnxVMQPR+eirU2Ea4sovkq+dHLiGkFhsxVAsS/8=;
        b=SHTU2c96VRzpE6/ZG0TYqhyGGwZOlKKXwchIDQ1d5FqdxybzKOq/+nVUB+TDiPEGp0
         vI6EAFrdA+vwP5u2n4YXZFQRydFYAtkyeP5qr9SCXDcfIfF+e88KizcY/VBXvxKLr/9G
         UnZtE4jJGflCI86VlbNPpqf2Y82ESRkltKR+pbugi1rc1gRyjj8RJ5ePsKPefD4vggii
         d+w2BDhvDmCv3Qgo8GS28H8C6Rf7sYNvM7gbGtiDny44ol9QckJd/tgtEekjYrmBCO/9
         bcvIWDkyEXxl5x5OJ/Gx9MglgghRREpSyZr/7YARRTGIpvsognuZnBco1SEMr1TjbYaa
         8Gkw==
X-Forwarded-Encrypted: i=1; AKwUvBwb54YOeeCdV+udmFR7SVIpjPRPpOei2hnEYlK2VXfS3NL9ebby2V4SoQoDhTJ6MXUgEJVXXterIU03Pr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvM81v9vjqrlImqMyGUCeXtdxoG7HlMLjTud0et/ZoIwgd+Mfg
	45e+yKANY/cSknRfFV4D6L6Us5W0Zk7Us+OhKOHdX2BjRHFMWyMWhgPSQ1XUHIkXRVk=
X-Gm-Gg: AYBFou3b62IxNM41aDra4USPykFqyZX76qpe6Bw2qL1Xk4wJCk2QmCOxY5MQJenPfjq
	i3RzBIi/4Lmi+U+IcRJqpE4V4QdAH59Vae5kZtKVIeZa7sLuzExqwhMNr/RSOlfJ7xtAqoAkmwX
	WzXeTtzKpn2tw+7bVuWqxL9ZTveipL1E4QwvXoQ7USnoqIVnz8fwwB8hp3Jr+BmXHbXD7Ua7rDW
	ngdqIwFT0U7vJi8NmsBRLAHdMeTAJHMxZZxxka99rcGsdHnfWIsI1NTli0e4Tc1f7kPj1K3KfFW
	xIiL7DXs7THdbwPVfUDO2N2Knianj/L9sr/8hWf+zh6xmwO/5HxchLZgvtUOvlyw26ClY8yUcqJ
	iqa26wkWCagxTga2EOHVX88dihckdpfWvbR2LjbcqxpQmvcINEkpTErY4gkK1umVpRFmKILa7R8
	yv3mwBPH/gjNnr/0M2FRfCMaZUobf3Oc16d12ZMSD/2pNroqyPR/ftzXTvyeqOxcvmig44sF3O3
	rG2INdz4aMAadiVbEQwvAhfJGW4LCLjaY5QpRSyZf8u0Gni/E6kKq4/deidvjJDrQHInIvYoTyD
	N+DhOIA4H3QoAxnGNG0Co0Ez2dfSnRJtWTF3ZJW269HT7xbEYexeMzw=
X-Received: by 2002:a05:7300:2152:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-3674db4d057mr3780258eec.26.1792576426668;
        Wed, 21 Oct 2026 02:53:46 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4381:36fd:9c31:126:4a90:466f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6382582eec.11.2026.10.21.02.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 02:53:46 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Hannes Reinecke <hare@suse.de>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed, 21 Oct 2026 02:53:36 -0700
Message-ID: <20261021095340.83118-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <378a9456-35ac-4a18-8c1e-80cc754dcbfc@suse.de>
References: <20261018010059.83120-1-saravanand@crusoe.ai> <20261018010059.83120-3-saravanand@crusoe.ai> <378a9456-35ac-4a18-8c1e-80cc754dcbfc@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/21/26 12:28 AM, Hannes Reinecke wrote:
[...]
> I think the 'managed' sysfs attribute needs to be per controller, as it
> would be extremely awkward to allow some queues to be managed from the
> admin and some queues automatically placed.

The mix is intentional, and it is the case this series is for. On a
host that partitions its CPUs between tenants, a queue only needs a
user assigned io_cpu when its blk-mq map group straddles two tenants'
cpusets. On our 384 cpu hosts with 128 queue controllers that is one
or two queues per controller per VM, and the driver's least loaded
selection already places the others well. With ownership per
controller, the control plane would have to take over every queue of
the controller to fix those one or two, and reimplement the least
loaded selection for all the others.

Per queue granularity is also where Sagi steered the series after the
earlier per controller connect option, since the CPU partitioning
changes after connect time and only some queues are affected [1].
Sagi, does the per queue model still match what you had in mind?

> And I think you need to check for interactions with the existing
> 'wq_unbound' module option; both claim to do similar things so we
> would need to clarify the details here.

They are independent. wq_unbound picks the workqueue type for all of
nvme-tcp at module load, and when it is set the driver never selects an
io_cpu, so every driver managed queue stays unbound. io_cpu places the
work of a single queue. When both are used, a written io_cpu selects the
worker pool for that cpu, and how closely the work follows it depends on
the affinity_scope of nvme_tcp_wq. To keep the work on exactly that cpu,
nvme_tcp_wq needs affinity_scope=cpu and affinity_strict=1, and the cpu
has to be in its cpumask. The ABI entry in this patch documents that,
and I can expand the text in v6 if it reads ambiguous.

> And should be we able to specify a cpu _set_ here?

For this series I would keep a single cpu. io_work is one work item
queued with queue_work_on(), which takes a single cpu, so honoring a
set would need a separate unbound workqueue per queue with its own
cpumask. A single cpu inside the owning tenant's cpuset covers the
case above, and a cpumask could be added later as a separate attribute
without changing io_cpu.

[1] https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/

Thanks,
Saravanan D.
