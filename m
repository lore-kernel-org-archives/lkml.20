Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD95326AB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117689; cv=none; b=sL0JVZbGBl33XCj7e1Reu3Fq/GgCeFsAv3LKOOIB1NdIxaJG4d04+CXV+bi43Mnh5j3ezMK0EIXKvWK2RC+2OIrZCy4t0VUNDLpc0HVzwbZPIvxqAS5M7L1r5H8LwVcDywSQHNHYv98o5Yr65LUyDlr02v+CDwkcMiLYYnL8fsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117689; c=relaxed/simple;
	bh=ySnK+hmdvoPJVkgFkjfrLJlNaWN5LOaQraKbC5hMV2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/wT60x5JYUbF2piab6YzfMZG3dllF1KMuB3fkep3bCSgnNhVGBDFvsu8hVXiDAVDp5ZROJF6mC1VoWV9Y1wzUKQuIHgolaUG9DdSfEc1GzOSZ75hgMO6GP8mNiZsuhYBC8vOZOGfR9fb+mSctMJ8QsoYyurpiwL+2ps39NYh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgC+Jg22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDdqa0yB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgC+Jg22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDdqa0yB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDXD51167885
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=; b=TgC+Jg227JT54tl4
	P5oAiVK2B3oGJAAJMrXG0Kz8oLZBB5wfKqJ/JTsnu6gDea3KvxyAXIqy06rrQHxJ
	BPTXp5Bw1Cy9Fx8d/V8xAxo+P/+OiHNzL9zUc6Wsok79fsbGQhIzId94CBYHb4bp
	skBUEfTUJYU+vlOqfF0o1arAozn4tgbQaZTjqQGXJKuL6nusRUJBJ3LRUKtFj13l
	aXK52LiNDgboYOpBgBX3YDbe7Ba/CY6ZfpjL8mVgbTDTaYgR0eW/eX3v1VCLU+/R
	aJ4fgVdyZjItZV3h+Jut4PysymBjF7GY/dpYwi6CNF1CHWgEUmcVoZBrwjvk4SCb
	hqqqFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0yg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:54:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so385237eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117684; x=1790722484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=kDdqa0yBYDg0mV/ZC5GcsQeqQySDGZzjfct3M8G9JV341symKAQ3eunwQkEwEH7eWL
         Qokvf5HQ0v44eNoE8EcRi+vPNJZVgGjTit3XLSl9jR1ayHarff8TPEA0ParnqjXAWubv
         5ejrDvEce1kb/qs2fSxQdxOTbNq9fGManETXoHxlGSDSqQ0SiXYRP75PeaAS7fx4PfXJ
         YFaHPgupMDbZMmJ6ZRWmlTiP8JA4qQ5HNB3Hqj9HEtbCRfliMFzbUDkELE5imoXSpz/8
         xED2ur5oaDddMXCwxoN9rZDAkTb3vQs3N0vr1TMkgIASRELBTrz8+2uwrA8dswbEMfJq
         6LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117684; x=1790722484;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=Ne/LVtdD1/D4RO1uOy7L9bDjBTR7GGDk5qUr+bkRvl1v+Wk4rV0HtkY+2X6oYcU0x+
         ppBTxxX6thDtzED0JF2EwVfLvoS67MKa1RPYWWYuABOi1+3OSJq6GgtVcTk6sNZLc0DJ
         iMHiXQe1npTwOvcwekeDLHg8K1kABpxZURJq8p9PR4Y/1UMpaaO0BHhpR8r5SBvxQrA6
         mHG0OljresIV+HsvBjmstpaj0Rpw7ORihQfLjKFK94HD6t3YmAjIEmaJMJeRoBOQdq3z
         IUA5/yEMsR8SrnggFFuoqprBe6Cnv6Xx5VBTw+zgd00AGOoMwmbzWhUs5FeELKYU42I8
         ktrQ==
X-Forwarded-Encrypted: i=1; AKwUvByfFXr2IWJJqU77VXgxr37fzK4ksMgirdoz8z3KidEFzDBrTyR5TCWfCm/QPLQE9inkb00SaUKIYD1Ampk=@vger.kernel.org
X-Gm-Message-State: AFuF++nbHlsXihl6jvPy84/Ck6/22ikIhc626+RSMKPvkth+RX1lpzuI
	dTJooSziBJkLm2eOr/125agJReDR1jH3yVMnZjipWJm7Qy9ksv9h37HAImOvO1ySpyjVEv+6+/v
	8dKQaTRaC5g0sXCDqslcRt8QeykitjBlCt91sEqANppu2AMleJYmXkd2U/9jLQo2zwj8=
X-Gm-Gg: AYBFou1d+ZzF3ST2lj+i8B3sJkojvL8jJOywtZQwpKsW4a+NejNPcLa7enMENNuLVvb
	fh4+0JsaREuPQZ3wmGzGdGzTKtVi9Gp4d3PnmdXY7DEe8i2du0vo7FRakDyMJ6H9loV25ol0Bad
	6GLd6HUU9RuVlg8tKnTwi5mknsw2nOQXn1vJQ7kM/XyGjclKHJfzFuRSn1pQFBwtGfmsI4sg49K
	6oe0gr+0ldjmbEghrjmYpnXknwdPSWzqJgFIKjEkXfkU2m3aAmV2/7cLpQHE0hrn5yjpWHfr0NG
	199KbXilzgtleyRmKtyKYwHPT9oI97R/U76KuewakUftIQZtl8EBEzsgRz/7o15WVDdMEl3lWNB
	jQH+RVSee3K/6MTGkQs+qO1i755sdVNYDxWYb2Po73xiPlq+YQFHrOQ==
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760371eec.18.1790117684043;
        Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760352eec.18.1790117683534;
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1320134eec.26.2026.09.22.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:54:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 17/20] KVM: arm64: CCA: WARN on injected undef
 exceptions
Message-ID: <20260922155438.00000f3d@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-18-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-18-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfXxWWPNlQMU5vX
 pF0eqSUUnBgqIOlBHPPlJw0NUuhKlqJfw/EY6I5aj8j8mx5zntGAz/8rqryKjV60DwiHo266GVF
 /8Wo8CpeVEy2oJOhvjow4KIOHiTfLPe9oAL4drws5cbPq84tDopKxKg89GkfdIlWI0oH3g5n8Tk
 xH7MBAJh5c9riGbSe6SJNbNewG2NJmU3e+Z1dRb9hkvRh3HLHiy7oxqgxXM/CVEcaXJhKyCCrVV
 IPUqIE331fRSx7SvRK1j+KqEbvWv3w8Q4EKct3fk349Z3McE6s70kg0ZVN9TJfUaboJLSTSLF+4
 cImX0hg/uCxK1B9epph+hr73WSkvuhK9wAMgdm5PigME312nC8dhhLMCYIu14ET0ygQbY7qE6uH
 8sNUADvWsEYVd39QoBlX4Uu9ngG3QvASzKcG+CRCgP7bgKyKabykltH4sYXxzgXxUNBceKIN65K
 BiUW2ydgQkqFrC2efpA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab30734 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=DI-nzRUvp28q1R9r8mgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: FzcUpI7HhEcK7c7iuZshUd_AHenGgdiN
X-Proofpoint-ORIG-GUID: FzcUpI7HhEcK7c7iuZshUd_AHenGgdiN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX1PLEZXO6GLah
 0cFLKoeIio5Z56OGdQEOl2IrdLZPw5cFth+j5JV11OjqD28QwOCLPoZ75bQMJawBgWg7AuWjUuz
 Ti+NU02sfopZJ8pBjJIdTCUSkT0nSE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

On Sun, 20 Sep 2026 22:28:42 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
