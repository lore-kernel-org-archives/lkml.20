Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250046;
	b=Ted6SrbAeEBMqFAz62lHpWS6m11bgznMlZ/+0v8UDqGFjDVMQ/RO4xpoYGMoYGTS92Ny
	 0mG+Vri6Ek90uPYpxdXf1yNRFGde7xR4agoGYDnsz25ezgOK62I4I0mYWKAR3BgCLHxNy
	 qKspoHGbw6t/i3MHTsbG2WI1xWygL4K5JBqeset/QpQgXLnu0iWZojPcBwVepbLTNFSae
	 Bnjc+yb9j8WBJv1T/qUExA5X5H0UVdekGaLUFyTZ1tyczi7xPV5ggbkAdplgczg/4nQWJ
	 68bKnR5wfD9p7vAuUc5B5S29j4Q3tddcwPuDW44mOA5C0Mr5LyXPnUo9vGHi6aXKsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bp17VnBvBSFn3pUqDNW8uNFJO4ozps2bt47BhpkIeVs=;
	b=FF3HB01pBRCnxI2dGPDwofsxMlWR72g+SHj8VMrnKpaR0sseJU0t3AUBX/WLl8cKKvwk
	 S44dHkpP0nHewXrTFoYwTIUYPjKYFjwNU3RAuahXnrsOtaq+HGu+CFmYXc8wca1zqOKF9
	 Gbxlgee07MwVql01HSAuSFfMJhk1X1WxOaD2sG5tViaxGALAv1xnclBYIRGzFPF4K8+MU
	 MCS0wUmhYIw/pn1teQfriiVQMsUqNcNnqxTrW/sjG30Xy3l/Dz4crhlGEJbAo0wgdYzQw
	 YhzXknnQXxdQSugodEMCTXqqg/M671sg7LlKXViyXXWKOccn/5Zqj9OcBS68DB3ZJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsA0jb13;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19398606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19398606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsA0jb13
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso1526914eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794250045; x=1794854845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bp17VnBvBSFn3pUqDNW8uNFJO4ozps2bt47BhpkIeVs=;
        b=FsA0jb13/AzjPiZ699QxFqAMRbUMEf/wzXbLqCsmKhN8hN3rnlnQFpNdwVSjN5IGHu
         3T1ipT/IKpkXo3lgaZIKbVksiNcd4CnV+O3y10/PCuw4BoaMBzHoAgotp29eiDZZ64au
         Q5RDV9qA3Wz/oCTNwkhVKfygePcOtmS8V3MdYqIz0lY60qhSxkGIz/J+MAixNFwdJrNI
         jkq0NzDDoAMAi2+uDLuF6OItGgs5jPTF3rMi392NnPhiPPMXTKVXCw0awzHaFf4b85bl
         BwzcOxGA6jm5YttMPHCXiU7ksJ0PY12OLEgv5LLyOIWdphdXokZovjUetHf6UFLMR/fr
         518g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250045; x=1794854845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bp17VnBvBSFn3pUqDNW8uNFJO4ozps2bt47BhpkIeVs=;
        b=ypfpre1uyQdUvTocXiK341/3TWasNAGiiPSIZmj2bqWAgtgPyOX7fZ/PpNSZIPi3c3
         z7Whi11OXC/4WYaLlePRUwWRoiD1cUYK01UcsgTbDNNt98uhM7GSYyRViJulCgxO36HP
         lDIJB5jFI0f3n6R+yjHldDm60Z77rj14s31hZO2+zbQwXoVbx7weBP2YLnBWLzMJfPTx
         gktGG/NTFl/UEkrpxUdzb1HcCIzkr01EBnqx1LXR2ZTvRX2fY17nwCSgJQ9x/4dXMkgT
         xKGI98fdoOQCGa5aHuQ5kL6NhiXt4+QTOKf7f1+oshlb+e3hscV4OoeBOp1Ya9ESRvmM
         vydw==
X-Forwarded-Encrypted: i=1; AL+hErEorwXcCgF1YlFk2NGu2UzgFsUppzbpM1eORRTS1zVkvb9y9c2xJiJRCYo8zz8pDqcpSFT2CoDGizyWNEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Eh2FrMFWh90lmK+9YDuOcxpCQs/ODMkSxdV9KF8fpCVcg38n
	GxEVJpDetGpodhSoN1stf6Mma3NwLZkXtPfNdFsRa6/NjFJ5GZ7FD8RA
X-Gm-Gg: AYBFou04VcEWBWVS2v1/prYjLv5aFthnwiyTBGntCdWNgtX20AOTaSAZwCOVvMEcJsZ
	anchT9X600dResPra+f7YG+dmVGcP0x4rgUDaGCDvjKQBMHfjVjRjYiT91u18XFqHEDrS9ukfKJ
	0Lv/vcsUU+h468HEmpzLCO60S3IApgqtlzjckJPDHpK1tWfR/ctulfMKjU1qv2B3IUxoNvc04aG
	WsfJEJPu598jhI1TpytEL0QpCPtdAPJc+guNN/+/BUXl+L0va4frs4Xc07c0PLXsP1LnCGS/fWi
	Rv1OU/JPau/wcQgJd2b/8HyfTBz++ZX1SinMR2AvTWNZCSZHBQQyTufuvpcbRfKJhS1xws8bGgC
	mtQkZnWuA+2F0TPip9v2hp67R0gd7vFsKxJJVYkvtmohMa4LOOAuGawxnZSNIlLWmlEdW7CkbKJ
	rxGZ34c8R/t+xiOnYDr7hDCsXdFIGMl4362+P6eN1i0he0YoeLUsD59rajLSox3Al1ZxBplXsvS
	PRqpNR0o4yAzWGYKbwE6obzVJAIPZ2PP3u+xib54KZJMaQsbm+xGcgmvhaXcvh9FuBSnP+uyLhH
	/wpeg8jp2QD9DsfgPFsJRgwJi6nsvf38iTkX0baW5aqKlSapBTjuCkEWRS34HbMEbC8HKmqRMOX
	djGc1ULe3
X-Received: by 2002:a05:7301:5f17:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-3751eb8b097mr156178eec.12.1794250044929;
        Mon, 09 Nov 2026 10:47:24 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm315231eec.18.2026.11.09.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:47:24 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf timechart: Fail IO recording when no syscall tracepoint is available
Date: Tue, 10 Nov 2026 02:47:19 +0800
Message-ID: <20261109184719.2794382-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021-timechart-io-no-tp-v1-1-71779e7db01e@gmail.com>
References: <20261021-timechart-io-no-tp-v1-1-71779e7db01e@gmail.com>
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

Hi,

Gentle ping on this one. It still applies cleanly to perf-tools-next.
Please let me know if anything should be changed.

Thanks,
Hang
