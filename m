Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111900;
	b=H1EcsbiqXKoDCGxoULrcjaMSRy6pwim/0Yqg5xZF5k3I0kara9931kbdRKwSECqsl+i+
	 BZ1qpi8ZoTw8tSrINSlQNw3YS8uX8l/FL1Z1IxthAYuEOxkRRSZoi0FxYABvnF7QjASq2
	 XCFCBVPMO7W+LfedkU9vaAa6ov6VRfHRNDVCBD32wP25jhRA477EIqZq0tPoKK+7dV8f/
	 D9pNwhSERJXAL6MO5lSKC0eknTMr2jJywbqjoxW2C2YI07hjpFDFoC47ee32gqLHSxvR0
	 afsl3+QvsNWSjxf4hRH0eX1+AtQaa/3TFuwd55QWD4673nGi8/9/2nvwcFw1Xbkh8kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KZJMLmuXX9sJhrtyIz3QqrKY753KM/thMo2GKlgX/ZY=;
	b=eUIEj8CYhwVhWDMIIy63nTKHyyMW1Sz4+z3M7B9yemuL1VGptSWoN+azlMUZCBDpfnO9
	 +ZlAbbYH4ncMVvgEQdZIqVUkcqfv+/K24DBL9iDTAruwSHXNZsF6GylyyCJYAYCZKN0qO
	 iL61teFcgGKSmPdNifhlAmidx9Monf+tP5hC2fvO7UptuYgFeiS2Qn8L391cLJzRft9CG
	 CK2bclS92PNwBHyo6mANoh65dnyOXPdi3tR1v7L3MJAy9H9z1wxMMO+bJ5OkdHyVidiyC
	 gwQRCJIdssTlN50cbFK/yUjtDAtJ+a/NuQfgitaWauSip0Z845U3YCQxfNyTisJiZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=QTlZKnSq;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ii601FQr;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D4606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=QTlZKnSq;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ii601FQr
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A83dIbW2508281
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 23:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KZJM
	LmuXX9sJhrtyIz3QqrKY753KM/thMo2GKlgX/ZY=; b=QTlZKnSqJMb+trqFGS6U
	AZ7w/DFE0vw9ltjPsMynYi1Q6FrW8Wk5UVmjUTI3JPX0b00cd58UJ5A/0KHMBDYX
	nS7qmIwJA8+eZCe73U2OMUC6VdJHJWMI2dAh3ISkk1IocjjsNwDi54rXFvac97Rb
	FDXnK/gJ5FJIzupP/v7mHqfwRDVXcvE0JakFvXDoWDmM/pmvV/ic7IO3Xq5PyyeQ
	BfPe9Yecxap6gs5+hzDJIiMufH1TNCHF9meVL3X3n871YusaivyUhy/e71tGi/PM
	Y0Jm8LAvs4p/gPZrWroGX6jp2nueUC5J5uPipq2EVvj129G0C++goEgyLu5RM/3V
	Bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hsy4umant-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:24:59 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso25001785a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794111898; x=1794716698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZJMLmuXX9sJhrtyIz3QqrKY753KM/thMo2GKlgX/ZY=;
        b=ii601FQr7cfN6jCjSyEFGn7xpVfcpuK8gVH5oYBBcOx+tZH1NLMzB3WxGcC42516LV
         sW2/JO9v4jtqVdGUWAPF9Tp6X70eWK+L3P8F8f6Pm/X694jF1q9hCJHZoXqoBXu9cjAX
         lhXA88TJLN95Dd/HRs5G2jPykW/rRCR2QLdhlZ6MxxB0TV40zivfMhQfXbMYMfXKGCOI
         OMMD0gDKPyzFPyxjBnal/4/0KBar1smOlan7iAzSOU1GdkC9u30TvuifluJapWsdxJ0u
         PVU/Z6yi2PDPSD9qXXcYIQRxatJweYei9mS1XimdS0kCU60d4wGkbRfS1TiHZFzIVBYE
         PKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111898; x=1794716698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZJMLmuXX9sJhrtyIz3QqrKY753KM/thMo2GKlgX/ZY=;
        b=rnJrRlKGHvvKJRdbFJCPfkRBBKy81GOd6e5UNP+VpAmK7qpW/uVruNgZnXdGztUss4
         oKlHf4zqUjSvQ+DZbqCdZKsGWPqJR+Fsn9sLefwdSVaPLtX/teeIbEQ7Vq1yZyf4m2uI
         wh6qlrlqC6E/Bgbq5Y0lcDNLBUlIo5HAKkE5ncnLlway0a49f2WwE7OmEI02FyyubznF
         dl17hv/oR3NPA1pMJS9P1285hBoeB7YlfKhew+WYIIac1jUDxr+ALFhH7cy/DlWhGayO
         4P29JEXrbAnqt7z0hJZGnEZsgGGYi0qS6gJiKsyjxGxUo/SiZCzLD0HHfaFwUFffYFfK
         H/ZA==
X-Forwarded-Encrypted: i=1; AL+hErHw4BTUEYqouHAk8A+y+3a+DQ1gNmmHguHYa2U188SqRPOSTB2jRbGXYhVaT9BRtjFdhg9qtbnLv1P0z2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SkA43zalUyOXqMnJDN4sKKX6n1PYajsYe1i/RJUO7rP5ryreI
	3cbZ2+X9FF1kbmktWNUi5i1W+xyTtZZvP/g/l3zsH0j28wNV7KZEmitPasdLaoN6DREFFiCmfxE
	eH7JYmYol2+PHsjwzKn7hY4ILqh67A6XHoJYHpPoWC4t0LlfY3DeWoSsSzOYvhA==
X-Gm-Gg: AYBFou3yEYHqOPGuIU2as0bJQLX0sVDzoiIEh/8B9g7akqj5B7CVDtLFW8+SOH9a2DE
	hpeyDXJ5yMwUqlORdqDla+KUd7yRbNgyLLgGz8SUY7vHXAK2QQQ7khaymtUKUudGdDglaIHOIhi
	PtqnTwOypWRH0yghtZIDqfT8S3US+RJJHZRg+H6R52ffneSmYdLeRXXrzveeQ7KRlQ6loDw3oud
	843OHfubEk/3evG0GOJ0mHDFG2j1o/pHHqoj6wOFWSP7UT0S1bQl/t/P7JcoGU7NpMI1FKMxvja
	faeAo8fPxJ160KkLjLzaEIxG4E811eKARTQxUTQRKufDhbIXGpUV4PbxxjWFeZytXgo62ueNpsk
	x0ULhlF2DZzHaA+L0VH+mv+27r8zvceWop97GVkuXDfWEYd4GswZguyC35CGk2+S4G0zNzg1BQv
	qpSBR8dEYVGdQtkmR/RQ==
X-Received: by 2002:a05:6214:f2b:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91ed241d308mr5684266d6.23.1794111898123;
        Sat, 07 Nov 2026 20:24:58 -0800 (PST)
X-Received: by 2002:a05:6214:f2b:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91ed241d308mr5684156d6.23.1794111897712;
        Sat, 07 Nov 2026 20:24:57 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceb56290sm10085586d6.1.2026.11.07.20.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:24:57 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Nov 2026 23:24:36 -0500
Subject: [PATCH 2/2] iomap: remove the atomic write length check in
 iomap_dio_bio_iter_one()
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
Message-Id: <20261107-blkdev-atomic-bounce-v1-2-f66344262096@columbia.edu>
References: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
In-Reply-To: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: John Garry <john.garry@linux.dev>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111894; l=1480;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=raAZDoGoyOUdBE+OG2rr/mS13qUOspHTisqUqAlpy7c=;
 b=CLzcS9Tl3wtyGtCIhcgXJGXi+GUmlZBXZqeULwvnGRqHuLjZlROfZcK+k64yvGX7pHkOtdT0O
 kJ+c0z9sJP4BJNuptANA537ABkv5+MZNClcxLmCZoYiCbzo1pJK+689
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX5q0PafDzj0eL
 2T/q4uod9QANpbWSe6A5Pp6yVg32G+u0/69IJ2ORP+rsNSCbPyB53U/Aek4c7U3pMFJ//c7GfV8
 etEKyqFz1pkli6PYqVZI3LT/BHGfR9cqb5DXvhN4GUnenMJvhj1JUXPvKFw1ek+XU3IqqKBqmjp
 AQy0ApHOg6zjeGXcFmfFMh6hYoNqBZ940BKSrV85p5VOjf0om+o3mVEvqK29qtMt2a9GrYhYoev
 aiVQ8DX4uAcmh+GJJNRVpBx2kw6LSk97yqbL8MAoYP+PogYMO9uwwhceQb5ImhgVKt34BFarUtT
 /IaefCH4rgV/PVL1AqZO4Rpfpwdr+8H7em7aPDapioI2hJ+qvVv7kuIevZRfW/ut8GSTaxOlsuO
 UdVyyN3hnPV9dbt21MgT4jwfYKauWxRAlSAxZwjTJSg3K/NmiIhlwlQauAixCbiymoew0LRwKPO
 9CtbJC5pVuNSffbmlZQ==
X-Proofpoint-GUID: NL87aGejWRxiOOV28Ant-e2u-XWtUkFw
X-Authority-Analysis: v=2.4 cv=S9JMU4sP c=1 sm=1 tr=0 ts=6aeff99b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=VwQbUJbxAAAA:8 a=I7NSszDGB1yI4--CJuAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX5xF6OMMD+jaq
 HscWD7i7vobvD119AHY4fOc1Iz3E8KkGUPVLouA5oxeJKojm/USjL9YGDnigbZAEChbt7WxeE1M
 a2rkkoGGGaj3eGDmujScLUukMwPkIEFlvsNR9YvWZ1RyzpnUM82D
X-Proofpoint-ORIG-GUID: NL87aGejWRxiOOV28Ant-e2u-XWtUkFw
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11959
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=10
 bulkscore=10 clxscore=1015 phishscore=0 lowpriorityscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

bio_iov_iter_get_pages() and bio_iov_iter_bounce_write() now fail a
REQ_ATOMIC bio that doesn't cover the whole iterator, so the bio here
always covers iomap_length() and the check can't trigger. Remove the
check.

Suggested-by: John Garry <john.garry@linux.dev>
Link: https://lore.kernel.org/all/82978d5c-3e08-48e9-bf0a-7913e1cd0507@linux.dev/
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/iomap/direct-io.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ad041ac3252a..aca7cbaea4af 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -370,15 +370,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
 		goto out_put_bio;
 	ret = bio->bi_iter.bi_size;
 
-	/*
-	 * An atomic write bio must cover the complete length.  If it doesn't,
-	 * error out.
-	 */
-	if ((op & REQ_ATOMIC) && WARN_ON_ONCE(ret != iomap_length(iter))) {
-		ret = -EINVAL;
-		goto out_bio_release_pages;
-	}
-
 	if (dio->flags & IOMAP_DIO_WRITE)
 		task_io_account_write(ret);
 	else if ((dio->flags & IOMAP_DIO_USER_BACKED) &&
@@ -393,11 +384,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
 	iomap_dio_submit_bio(iter, dio, bio, pos);
 	return ret;
 
-out_bio_release_pages:
-	if (dio->flags & IOMAP_DIO_BOUNCE)
-		bio_free_folios(bio);
-	else
-		bio_release_pages(bio, false);
 out_put_bio:
 	bio_put(bio);
 	return ret;

-- 
2.39.5

