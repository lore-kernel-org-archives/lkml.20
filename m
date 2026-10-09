Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64638448CF3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564632; cv=none; b=pOsso0vd+iZHWjw/8hJnZn65VN5zcVNYVIfGgLsf3eRnxUKFxA2RnjYa415jecaBgd+LSEeDKy7ITq2cTnfRQgMqhsgIODQv/irF+fnSYMek4NnTTsYRqSaDSH3fEc64YtGZib/CKRP7EaDWJF6/tiuTR6WYt8II4KuSLkTMFbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564632; c=relaxed/simple;
	bh=dQNMb5/wuPELUla+30Ybhb/m9cvIEvZQydg6aWFrln0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6hlDDoyXrjLMtrrUfO4Guah1knPFNwPSzFurbZj4YzEbfRjDRks7AsBZO6KH2uv0F1N3CVXg4D3KjknPhEkRenf+b1XLKgy5+0OqrVRUKJPULBd7zwx/XvUZsMGJpPhUM6E4bdHYjTq4wvpwZaaDeVTGkCuzHlc2VdCuxIePqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=t03+EVHC; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=yf1xfgJ4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="t03+EVHC";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="yf1xfgJ4"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GYFqr984442
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=gkwv
	Z+/1V1m7k2kzWuttuR6zzSD/UrFPm0hpOSrXf4w=; b=t03+EVHCUxQKMU9i7Sjy
	R5fIxS90owqI2qKGbcd/+gzzactoRAkxe8q5wCAK+GhywScGPa6GjN75HuM+wCSS
	2C/eAL3k+zsvAyF00a3SA20/rlJqN740egm+ejqT4c1ShAy5n/5TTsadWWu6Q6md
	0F3+Hhs331ktNy+VQug9cpb1KR2/K0URo8tsblmqUT48Hlv9RB4zRL3lO5/QkCCH
	fFBADCezOkHJC98/ukqaBcLKFVFVe5e7giJJm7SdYdqiBVMc7nd3hzqmsDB6OFDa
	kc+CsWtVtqzuskrQTjFVJIHhtn73mnfyV9Q33j1qRwS9xjpXcHD0MWXQ/Tn8zw+g
	GA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h6p2nn4a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:50:29 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350ec54bf6so123729511cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791564628; x=1792169428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkwvZ+/1V1m7k2kzWuttuR6zzSD/UrFPm0hpOSrXf4w=;
        b=yf1xfgJ4/yk2q4UhMIW44lwT3SXmDvwRvRkGcYHVUTPVC6tFbm57M4v8311UfWBoWZ
         jjLYSCPqQpGLG+P53ciREiX7DGghB3+BQo+u+ur/qkka9RNNt5+f2eA8gpKLZow5fBGA
         Vbd7t6c5cO5iwTMnkLTCl7JXWeYu9O/7Mh1km+1NGglHPFxTfUianmOOmrN4oysZT1CL
         h/chPQJG+TBDfLnbf6gycIvFjqh+a1VgecOYqeDYvmErcjPUBt2hSVrzi9zs4gphITOT
         PAfccyzVk3/iVgj0Z63BTSUDIU+Lkh/z/T4wsbDiUssPT0PUZN+KYRRYHl1UPTV3KzeN
         uzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564628; x=1792169428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkwvZ+/1V1m7k2kzWuttuR6zzSD/UrFPm0hpOSrXf4w=;
        b=FqkjyuIKIEAAmtlero6jAY8o0LKRQIOxFWd0Q05ysze9NoGo3cbwbGQhDjLNAOdH/X
         lqDVkyhucM4KUp1e7mzIclV4oRjAh7T9RCbnJ096v4q/34kLZLGhJlV4Fb3r/7I9y5sr
         DvzUwfkqOJT2ce8sP9vStxlClOX5BFrh5nCeRfgnw2yE37c28ChzQzfeOImr9l/oL3Se
         Fv5c6mIiyW4PfkPQIDqxpqCZcxLi/GuWmffZOF0cQ/z3mFfFUO6LLIWR02zumrfjb0rE
         NnNrtabmolq/LdjBowx+Vu4wL+ZjRfClj6Kz4il+inntvo5VPKkudSj8pG6SzCIYjdd0
         j7eA==
X-Forwarded-Encrypted: i=1; AKwUvBwsYztuxtt9oRcZKzh3V2BJ88amO3P0MHcJGIFysvryYi4JaquJyK+FMETljqOuOfmuEcGD3QThEzLphCk=@vger.kernel.org
X-Gm-Message-State: AFuF++mdt4YJKujTxS2S+a2yb21RI7opjJ6zobsSFlaf+LsmGSuWVVgB
	1suSmBkxhuYnRgWPunAj5ZkmKVExws/jIGX8q6JzupLu5z7356r5ZBSe2sDBDjD0TE0c2n+I3VF
	feW62i8OZCzk7p7dFKrpo3bpvHj9oMGGygxE52NQiBrH2k6XHRUWhcJjJ93iPsg==
X-Gm-Gg: AYBFou20D7tFITpjGNmfN/vDpglPlDNy6MdaSHxg2EdNhq1BfS+gLvjpVbgjAeeMmeB
	zfIXqCxKJBtVQj1rvTW3FVuHYEbfvhqGaI42gYq8nFyW/RvGcEJRaQ0w8iW4zfdDvKB0l7Vh/qN
	GSobp7cmnXBYwl2l9XFxykFweWs4YprG0ItZmtXpIBcOLsnc2hp9U5+HMnlOvN8I+lpZ04aMxFs
	BCMjvFGRQ7IbqsUEH02wSdgoDpgpV6ZNBGDZAIHKqio+6s1LsfExsyPL9THHY7usb1vtGFpwemN
	U7r4YwypAKz5n76ljipr0P578RF7Jc53oWPxg9AQ0htKahCSsOb42y+7XZBTEKD3VZVf56sm3Vs
	VMO3LeItj6pFlgw1hZX+6HwvRsp7aYq/6Py24+kyzxFrfmeU=
X-Received: by 2002:a05:622a:8ce:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5359fa73749mr37098691cf.21.1791564628461;
        Fri, 09 Oct 2026 09:50:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8ce:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5359fa73749mr37098041cf.21.1791564627857;
        Fri, 09 Oct 2026 09:50:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b77d0eesm22234701cf.19.2026.10.09.09.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:50:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 09 Oct 2026 12:50:15 -0400
Subject: [PATCH v6 7/9] iomap: reject atomic writes in
 iomap_file_buffered_write()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-blkdev-fixes-v6-7-307939c387df@columbia.edu>
References: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
In-Reply-To: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791564615; l=1258;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dQNMb5/wuPELUla+30Ybhb/m9cvIEvZQydg6aWFrln0=;
 b=WZGuKbqgstXPQfB88htkX6didpQHdTq8xJ1ra6e3bXkVqmC3AAsryMkhYBbhxHoVysg1omLol
 13qicZ+RfMGDf2fzWd785at2EVFZXPrUx3L88zIp/oAJyI6/Yv8cEDa
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=eaGo7LEH c=1 sm=1 tr=0 ts=6ac91b55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=ASVHLkjgWNnnwhGXR8EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ij6Z8nExhQc4cJXHw6dZcm7YPTk1-5fP
X-Proofpoint-GUID: Ij6Z8nExhQc4cJXHw6dZcm7YPTk1-5fP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX5+O12CTFxphY
 9UtvJIg6R/9zoZs5TJXsjsWqFKY/UzCtnvUQnHbLBu5dsUmHih7NWhdIf6UfombJp1VxGjlNcOc
 D535kJ2FJYt96Sk0c+OZ7SYjKPD0b37byobxHxmJLTF0sWRisfJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX9v6yI+vaMiec
 1PxFJAX7SSnT1Vg2qnVm8EhTQLmrmVrAAAtfszx9RM1NILg1rWtSWmZ3XBogVHqn1R20CPHcxPE
 5diuRXmqog/nn7D7rZGdydvXTznzNYLKsYqZOxtUU5JQUN+3qb3rIS2ByWOO8M/cSwYdcI3EMqO
 6m0KRQYWGbZAZZI3jwPeHMtod0nOCbuJ64CTDqEZ+GiavZ3McdblJWKlPk4CfXNhsFPlvPGMAtX
 fmFTAsSL3eTGeFnZwxY2+HSHB1n7JOLrBwBWXWVs4cSvZvGIcU/tuGW8gU+JD9bIylxmibK16C2
 zh82W+YbHRz6F2fIb2wvHkcvN0yu4tSaRVlc5VMoOZ4EXcebvaJhKNavw95WEMwSDjJXZL0SdHz
 tP4Erl2SeV2pH/nvXyH9O9WaNu6gViUWin5kj2b6OcQX6iAKgk1UfPSZI4UCQLcc96YP3DqN0Az
 YTTwBScr600uhb9b1Xw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=10
 lowpriorityscore=10 malwarescore=0 phishscore=0 bulkscore=10 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090067

Buffered atomic writes are not currently supported. The page cache
writes folios back independently, so it cannot guarantee that a range is
written atomically. iomap_file_buffered_write() does not check for
IOCB_ATOMIC, so a direct write that falls back to it would complete an
atomic write without atomicity. While no such case currently exists,
fail IOCB_ATOMIC writes with -EOPNOTSUPP, so that a future fallback
cannot complete an atomic write non-atomically.

Suggested-by: John Garry <john.garry@linux.dev>
Reviewed-by: John Garry <john.garry@linux.dev>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/iomap/buffered-io.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 0a5ebfda90f1..e6654cfe1cbf 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1304,6 +1304,10 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 	};
 	ssize_t ret;
 
+	/* Buffered atomic writes are not supported */
+	if (iocb->ki_flags & IOCB_ATOMIC)
+		return -EOPNOTSUPP;
+
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 	if (iocb->ki_flags & IOCB_DONTCACHE)

-- 
2.39.5

