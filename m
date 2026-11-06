Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991709;
	b=cSHtp1wfGzYKhrgIuIXt8cwopBGTUQpM3q1J6jPfBOoN0MIf6LDcE1EqRY3ImrH1Xp0v
	 uuhsmvMDciJ/+nxkaOozonbYU5IhvJVd6hRD8Bwbd+wnWG4x09ohWqFvmHix8HpFyeVEj
	 mY4NKjd7oRT220fWzzoAmv2pFNEiO6EeEEkDSz1wIDdULyyrVmCdJRMPK6kzUUy4dfb9s
	 r5+dTD/gF33xo1gd1kaARanBeTfCwv3f2evPFDfadKEV+uTdm3ZxuAgHNXh1OzgP4aJ7u
	 fL4TMUFMs+lZmqhf/avVdH0UqH4Xctb6I8CH49UDmaf9qoNHd1Z8ta22987+543CtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fL/YIVvmAkn6C9fFGJOz5bLgkfP9C+qON7W6Gihge+o=;
	b=vZ3ECuFW8aTGYMfKgI9KUM78ncfvNrDWgHJ/vCVYKbIbFirnXRqA3CFvy9Fnf4eIGPjq
	 1b3u1Eg/XRc9cxJjV+SDOV/zSj01Gy+tPyypK3CveyFurJZ3LFcPi7JEaxvyQskrJYnvJ
	 cy+gNuZcla2KqhlBEkvXH8Ap68Bs7Hcon0Sybib5BOU0hXVz2u8bWxT0xFkxEb7a/l92o
	 hiqLpzOKcL4iuNqVYb6vlGPrPvv1IDVNUSEt0x8LcvfaVOaiT76+P9lD06ZG55zb8Kq05
	 ebaHkwzDwkv1lFv7YbipBeG3e2yW5bGYRJ5d8wKLDXSgOmPeUnu/uv0WclQyk1qrDBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bHh0sPmG;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="kiWAWu/A";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E95606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bHh0sPmG;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=kiWAWu/A
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6IvFTc2685620
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fL/Y
	IVvmAkn6C9fFGJOz5bLgkfP9C+qON7W6Gihge+o=; b=bHh0sPmGt3w6lXJpywnU
	gHW9LA2ulBlmWFTk+UQxp4D6pW6D1GoHvpSXB8X9oDIwhPvW5oDvvSoFi4T+g54U
	wl/DjeX73g5dfCv4evrstZ41ulgHBIGQZp+0QxJ+oEZW/g5k3BTiMNdDRheJJDzq
	u/WHCscvDClGg8fhUS7TQVmByvxCyu7t8jDkYmUgTDfGF3LrUEb1rUHTZtUv4qbh
	3HqgA579/OhEdFiKYyd8k/50Na3RsFIWkTh5PX0wqQp15hguEjssTqkzbyJ4mpxW
	0QpTuzNfrddS4a2/tSjCEKbQ6wTvxozsfQBw/MRTVF4fGExBDbilpWxPTFWXmaPc
	cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hsky6rcu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:01:47 -0500 (EST)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998de183a74so117173241.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793991707; x=1794596507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fL/YIVvmAkn6C9fFGJOz5bLgkfP9C+qON7W6Gihge+o=;
        b=kiWAWu/AqUmtMaGBfLhNAQHnPcUlFBEFs+4yykRg1uVZE70jk6a5XCbFn8X7x+rUVs
         40nALXclPl7REDyQIqy2ACkMRMogg+B4jcVWdc73YQaHuA5a8uqPuom0n7LGf+pmXIPM
         Lsa+jHVWVqoAbRsmU9V1+tRMmT3o0t8EK9jbQh8vMJhijDaXd0eUz4zgxi6vV2EKdkxX
         D/QmqHySa35s6n36fTXVVMDvUHDew7GpIsLCBNN+skgBuzsauDjfiAFM2pKPJPd0Y2eO
         bUDGbATJI3magOmkY5Qqt0+apPAgynzM9ZqCz0vlVcwS5yN5RzIb49PL3oEOe9Cr73Qh
         EfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991707; x=1794596507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fL/YIVvmAkn6C9fFGJOz5bLgkfP9C+qON7W6Gihge+o=;
        b=QunnZZZFm6pWdip4VUNHfiJBXeCnSebpgiiTuxZzcSGHYxLwqPTCOhPB170dzQULJB
         +muVzkqstHvuqjVyHW30RQtoG+tzpbHebQMxCZ044rNxiR5kxhX30ozOsb7cK8k/WeK7
         i29i3fRTIo2YFyZ1K23oCTTUsRoXishz+ALkoq75iUsMR7laRnIxr/O3m19ANLXG1D7l
         FAVCrcNh2O9/y1jGzGEzPduestodD4KfnECWfcCjmIieSfpm/pT+jTTGkOlXnqkDuolh
         lAXVWq66vc/Eg5Oqi7ec4MFXcZtLG7b/SGwuDKVyLW35btGzT9XWfNSFpb+u/+UXQ1lq
         J1yw==
X-Forwarded-Encrypted: i=1; AKwUvBwBmhwh1s9cONIatG7bps0+WwhwbL9B3rjiGVeIbgbnxyU+uXa6Ol7d5oGdqjkwyw3VmZCsxNT5D9aJ0QU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZuI0YwLHXacmyG5Dr3ZxVVD+JMOhUbrcF0ZfAAb8FLvbAWNmF
	hkRnT6Ci2n9KeRLudG/w6Ohg0yAf2OefpdX0XfI1Vzv4BS/U9fS4f5Z5vMTvs8KUGEyAlyv9hRk
	AavAyEBRgnaNIyfvEU7+hrALYVeCLjET9yj89gi6l22GAhW0Gua1uvkEC3pGjLQ==
X-Gm-Gg: AYBFou0lUBHHTsCfgAsmM/+NjO4AzO+oX4ajQBNsEAxWT6BU11LIA2G+NItibGpXf5h
	JQMTBvG9c2u4irYhJFGUe4a5PPgQ9AKuN/4IdrdC+ucf/92pr8N6Lg6I3P+5MAVetvO53wayWY0
	9nfOEo3jGqSqi7cdOGOslp0u7qiOwqHBth+Bel2jU2NrbyjB+fYfSqyD4zrn1om8W2rrPBCbLDi
	jS+b0E6Xf8BlENm9RkQlluNe2vrkib6Y2GTvYC5SCYrIzG1B/9rxvZ6o7whnX0wWPn+C1VWBnNC
	v/QZc1K4/zDosw69Y0zvnVmxGIsViW581+zYIq79CzW8857ETrgYhGSI4ybmLy15lI/ch19vpJP
	5Dq1BCGnCnBMDXRKFBvd+HrjqxpjLT+O6yRx06/Y6adxupX7o9/r9fc0Fb/6JOqfp9EDq5/qkJi
	+nY8Dm4m+V+VNNP6vv4o9g
X-Received: by 2002:a05:6102:6e85:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d2a130dba5mr1434515137.1.1793991707093;
        Fri, 06 Nov 2026 11:01:47 -0800 (PST)
X-Received: by 2002:a05:6102:6e85:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d2a130dba5mr1434461137.1.1793991706468;
        Fri, 06 Nov 2026 11:01:46 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-224.net.columbia.edu. [128.59.176.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a71bfesm27276376d6.25.2026.11.06.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:01:45 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 06 Nov 2026 14:01:19 -0500
Subject: [PATCH v2 1/2] iommu: allocate the fwspec before dev->iommu in
 iommu_fwspec_init()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-iommufd-folio-dirty-v2-1-3f0b0be58c4b@columbia.edu>
References: <20261106-iommufd-folio-dirty-v2-0-3f0b0be58c4b@columbia.edu>
In-Reply-To: <20261106-iommufd-folio-dirty-v2-0-3f0b0be58c4b@columbia.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793991701; l=1738;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YImvvlZFrqDYla2YNZWpOm7iJ9MVG0DC+EbXLLfh3dU=;
 b=4qBysV3kPQuXymvnOmYM40zaYRun24qvJwtSagbCsn7iDgW1QXdVZHNrhWKtQtyp5lNkLdb8J
 S6OX8vIHdksBh3/k++tb4I1JuYTHNe0aG4bOjt1MEZoMmF7XxX4D9fT
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: UJcXSdNPzP9ANPaucngW7Eduf1Hsq669
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX71+KiO2F56nT
 RxJCILLGhIq5B8pZa1YPZKCIqwYvA24xbNnrOCjkgsumWbwOjewJYfJwkmey9Tm2alOUuH5h0YC
 kVpGPFFuxwp4icIpqzkSvJUDYUdgEjWJQnEA5DWcwk51XpbLrvlY0S++EG3w0IRBX0AydEOBUwL
 bnm1jsGc3+UDQ+FEap41J2/8iXmkHkvkd1KmBluRMlzP+6L+GY1xKVI1dCl3YqSWbLfvRY/qIot
 N8kPhxCmTzPqqm5xe5Ln2Z8xzSmfCI2dXB9bibYB3Oqmv2fW1Ec+ZysG0vpvuNTvj3EageaZCya
 ZeQ2r4fTV+72Ws/rv3tRrSlZgja0CVTsdndmF3wOierFPCp3fnjr8+2tBX0qAIW3F4oB1gSTGO/
 ASMjVFu9F1+gce2Xmyu4+FpbPaZuCnXVJrin1GcXby1aG1QgXlemY6a9LGc5rwrAQvuv3lfD+Zb
 3SwglSP3bNAB72/jXxw==
X-Authority-Analysis: v=2.4 cv=ae70Dhot c=1 sm=1 tr=0 ts=6aee241b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=bIa82ERlpw6mw/X9g1H6cQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=zvkRjCzplxS6iKm8slIA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: UJcXSdNPzP9ANPaucngW7Eduf1Hsq669
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX3iYEfJ5hVhta
 3aaBjWI07LtA3u19WaK+vAxDU7GCGYgpy6EJP0/LSXrQ3Z/YfC9Bt94LSYespNiaiNjeTHoxQ9e
 fcR0cOGtPVlKt3wWE9+ngvmQFMhpPrYsEtkWoHbYkUyaZCtxBZ2J
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=10 bulkscore=10
 adultscore=0 priorityscore=1501 lowpriorityscore=10 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060075

iommu_fwspec_init() allocates dev->iommu and then the fwspec. If the
fwspec allocation fails it returns -ENOMEM with dev->iommu left
allocated, which only iommu_probe_device() knows to clean up.
iommu_mock_device_add() calls it outside of a probe and returns straight
away on error, so dev->iommu leaks.

kmemleak reports it when iommufd_fail_nth injects the allocation
failure:

  unreferenced object 0xffff88811c138b00 (size 192):
    comm "iommufd_fail_nt", pid 783
    backtrace:
      __kmalloc_cache_noprof
      dev_iommu_get
      iommu_fwspec_init
      iommu_mock_device_add
      iommufd_test
      iommufd_fops_ioctl

Allocate the fwspec first and free it if dev_iommu_get() fails, so an
error leaves nothing for the caller to unwind.

Fixes: 2a918911ed3d ("iommufd: Register iommufd mock devices with fwspec")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/iommu/iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9a..8cdecdd119b6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3083,14 +3083,16 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
 	if (fwspec)
 		return iommu->ops == iommu_fwspec_ops(fwspec) ? 0 : -EINVAL;
 
-	if (!dev_iommu_get(dev))
-		return -ENOMEM;
-
 	/* Preallocate for the overwhelmingly common case of 1 ID */
 	fwspec = kzalloc_flex(*fwspec, ids, 1);
 	if (!fwspec)
 		return -ENOMEM;
 
+	if (!dev_iommu_get(dev)) {
+		kfree(fwspec);
+		return -ENOMEM;
+	}
+
 	fwnode_handle_get(iommu_fwnode);
 	fwspec->iommu_fwnode = iommu_fwnode;
 	dev_iommu_fwspec_set(dev, fwspec);

-- 
2.39.5

