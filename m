Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C854E06D0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065999; cv=none; b=QhR5P7lyWj+pUOAVq2ExZxnaLrN6JkNNcJ48aE0RymPr0aVBiWVC13W+RhWfIXez0LNvktC2gWaBWC7978aSvtHBrOwkjgGMV/OE5OsSZD8OPkir/jp2xR5JQGPGZq+Rb9qaSEZonJQ9CQzQc+Og6oTXAu6MYsyx7QbNBhM3noQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065999; c=relaxed/simple;
	bh=X3NY/7TiPZb1ayBoO4JqEe+o2QYp7NEtl+kPkVXeLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BT2U2QAbKmHYuHvORQEpY1sRV+lEQi7tEujnKqJ9OwC7WHB/B/L5sU9BA9J2vAsOMpi8CFAucC7qzX1GIJ15fJeoNwb0py0GBp2QefFowPD++Z8utRJoGAsw2rZYhsBKACPV7Ia1ZN0sGMBTdG9a/VPu2kQz+AZ4kKJoOsXyod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSoSODNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhkDcA0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSoSODNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhkDcA0P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jGbK4077444
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=; b=pSoSODNebq4YhKz4
	f3NKdiOlGSVh+V+TgyZcHUNI7vwRgsOga42k7Tc6ppd06qtnuw9dmeoI44c6BcGP
	DZbzCbh+do+PqcIcE0kzzsBC5W7lH/dWDit06YgOhh62v0GfvPZEO4j2UguJtWE6
	Omti9hpmXG8CNZOh8VvGuungzx8Sz/IBuJtJzvHJdyrfF+9vbVPRq1iiZZiI7dfa
	znp8wMDo3PwODTPBLa8b5ftUZmG5OJMJq938m6BZ4+BlZvZnRkemwE5UMQvR904D
	JSVqm7U2R+ppP29AoBEmSwcZMmX5R1+r9W2mZY3VhWx2rHe6U/cOk3LZsqy01ILE
	EQ3E5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0kmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:06:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so1127793285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065996; x=1792670796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=;
        b=LhkDcA0Pg4+4GRgGMTzhi5rzejtWZGg/tkWg3k2wMFcDoK7aHBW8R14y4Bqn0eTcc4
         649AC+BKh/jtZKfKrYXf0ijflr/FaDyJn3O2nhXW0ib8PR4rolgnRS8ldZTg2u8Qt/q7
         nU69rfQ82TO/CNFdFFAkcyoBpF2JdOS2oop8fQ1zb0RSMUNyHzJuHQcb2RHDbu45C7Vq
         NQ4g3+23nzFJB7QMn7JuZ6XAffuogWkVnt5COXdwnMO2qPjY1O0kX5n8f8pFajw4RUzo
         KlGllFztiXpKLQf3nmpXceQ3T7TxzSRjahe7pXbbe0vpicCqf+psgaCFKI71Q/LRECtx
         KOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065996; x=1792670796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=;
        b=C8dHcQOBSGyjdOF+LxUEqd6A/GrSHxC77YteqCr3xq5O0T43pxD4CRKB4dY9K+fUJf
         um7jw6WBn2liGER+oli5/DVsAzz6eLDtwLAR+pd5feyAr82DxWsLeYLho4NrYmo7G1vz
         hR7kODI1Jqc3FVXqUlPGMX0Xb95HFq57YaGY2/ebilPSu1mJuI8sOq0ct1Nw38txtpeu
         6h34STThDFn+U/43gSKioYqYDdtPQSP+HrnqIe1rdM3wf25ajrERBzk88ErWmaWZd3q9
         Cz2/GdVDSXOizlYIceL532ZKL/ggNCxMfu0EbmIsqc5N8b/ZfxUegBguFDkBvOayvaMg
         faFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9Q6DBk+IFc9EsghEtENPG5HYFS3kPeUi2zl94IrwXStCIRoOSC+1vsqKgHh2eqnDOaTN4AX+p9WuL4BM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAH2N7Z2TitCXzknn6Z+5WvuVD+f7bDRRyZ+GAHKMA9DI/2hU8
	nXiPQB8jS2HOZPuJg0ydVfPIewJy1L0jvMOdcrVEJRfPCyS1fAW8yJS8dgE3rCIFjbbQ0kCFAAP
	6G3BkESWOGBR+ZZJvpcEMHdHCROfWxkVhtT/niBIdQTEce0MD+HQmqItk8PzB4EcCddE=
X-Gm-Gg: AYBFou0IUJAT78MEteC7BK/6iCDTYuu0oEXIfmFz1dv3Rdi3MtZ+8OPYu77+1kSGGH9
	NDF9rRmsq1QTR1JCMyrn7owfGLnCRIAFapJamRSFzXRd99VeIFPXT8t2IbHIA5susvay42f1Vv/
	wmEJWa+5B8J2dGx6wJJgd/fu0ToKUCWJLF4xL31JYARUFzd8dzANk6lrE8vkgOkzMfoPkaDea5t
	PmK+DlUJMaXUob0joKv9hlKMq6s/gMXouYq9XZnRq+oiALiGq+9mXEjQzrCpgOxzUi/SgHptK8q
	/fyt2whFxrnhb+wiLdORFsgB1mU1rmRAITliUxMBEbU82W0TdidEwZxeBohNVp4UpGz+dS4ok+Q
	hGDFrX4QcJZPyKliZAFxrqrrqbP0=
X-Received: by 2002:a05:620a:1991:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-93ebd0cc7d1mr3064789085a.10.1792065996452;
        Thu, 15 Oct 2026 05:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-93ebd0cc7d1mr3064784285a.10.1792065995923;
        Thu, 15 Oct 2026 05:06:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm17583804f8f.35.2026.10.15.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:06:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: kunit: fix GPIO device reference leak with __free()
Date: Thu, 15 Oct 2026 14:06:32 +0200
Message-ID: <179206598984.9610.18154781769344073751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa7be0eb1f@oss.qualcomm.com>
References: <20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa7be0eb1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0c1cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NiAw90gZ0SZeDWJ80IwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX7tx+eDp2iKlJ
 Y4NtMQ8nIkPUtD0qx754g+lzkbbarwBYl4w+hpeDB4i8fgfvu/C7aJ6TdGuHQGlNYi+01RmRERe
 fhlVcboDzCWPnVdbpZ6qoipUC8/OR6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXwhB1p5SZl5rw
 AInS1tCwtr4ojYaGLK8pDio+G/1XGP6loD9P9k653lr7P2A9NU+N1AnAb0l7bnfq2D2NEHG7cK5
 MvqffRxh4YwrAnfl/1aQlecZvhC4MHhS+3JIxUKb6o2qOxiIRpZPy/8HrvhyI1HBJXlETFHJMAL
 2b54Igi+S49ifsM3wYkyxSNjqAJM9YUIGpNAGg2BYxfCGYst8qB2G14tVCD3FuvHXa3Uqpv4IEA
 pGqwjXzJFgQoiZZzQ6i/QU21ehKE0I21yts27mIsNIqrhpmjNh87NQyVOkzPyrMLqdpDBiTupW9
 MvnmlzIB0vr/z6L4aJSYZMREvZavPhvZYx5PWuCVuiTVSKg7J+ZWic2gML0TwZK/7qBu1aN0ADy
 cb4a8gQe+yQ3l7UzKcaN5x4JDviJJA2KtRJ92BuktDdLtrQ8wEIXqPvKabq3KaZPxB8GCLkPPv+
 x/vadYHTXYNtLZbez9w==
X-Proofpoint-ORIG-GUID: K5r_hm9VI3yONQsm3OId9Z4AszUzFqZq
X-Proofpoint-GUID: K5r_hm9VI3yONQsm3OId9Z4AszUzFqZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150048


On Wed, 14 Oct 2026 10:44:02 +0200, Bartosz Golaszewski wrote:
> KUnit aborts the test thread immediately using kthread_exit() so the
> variable annotated with __free() never really goes out of scope and the
> associated callback is not called. Schedule a kunit action instead.
> 
> 

Applied, thanks!

[1/1] gpio: kunit: fix GPIO device reference leak with __free()
      https://git.kernel.org/brgl/c/851bb4a42991666f515040e95e6f40191da9e899

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
