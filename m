Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.128.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865137;
	b=aof9avyTOhPpF0mAwQfoUuEBfmD0slq8xGMY/a4RNYwcrAj1cNDM9lCVzZENRDdoLxy1
	 pm+brITpCi4Ciq+UNRdRC1JTANc14hlwc5e7S6FLPei0bulPpDys+OSLPwDuVV841atNq
	 oM74766Ew3GkotfPws0yVcd6wj5vGR42s2AEq+UU3fPQJAsYHvsfNPUYUW7xAw9eMTcW0
	 ve615nCyUtS50mQ66QELEwja9NaC9nv2k0Q3aMx3NkkA7vJF0DEUHLNDYkXyrgOpsH5Ed
	 ADU5Id6HBJYzMpcgoc5LE9SjaFwmbLIJeNsK0qxlF/VCuuY5kPlc9Dvw+pwtpEXTFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865137;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5NdUmuxYWiQx6VVv4ZGzfckUZqiJcrCbcmT5yyCYJAw=;
	b=KRsVkAJhWJeFQVUf+sj892kRb0l/WJ1j0Ef7ip26fr4hku8mlUMqxIzGciT0oAdF30ZK
	 HVfXTRaDMP2G2Pgs7YRPO3P2SfCQokMdvdh4P44XoVa3vNVufC8o2ln4YdujEij3AIBWt
	 h1uVkzK+qiRsPbyPy4i+etV98svu3hIe++xmeyUKHluhWb8kfmxGoULh4piSMEhrf/g2h
	 356t8nM2nsTCpFDHZXtJB25xfwLHfkkPb0yb4d/nWby4bUaHnXoRE323EzXUzWXFCoYSW
	 9X2woAdGvGKdSEukItQ7XMvvxH2EOsfme57hc8A0VRjeEnlTu0Q02qW1akeum5FgvXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="kk+/xwEL";
	arc=none smtp.remote-ip=74.6.128.84
Received: from sonic312-22.consmr.mail.bf2.yahoo.com (sonic312-22.consmr.mail.bf2.yahoo.com [74.6.128.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A083606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A083606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=kk+/xwEL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793865131; bh=5NdUmuxYWiQx6VVv4ZGzfckUZqiJcrCbcmT5yyCYJAw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=kk+/xwELzInQlXVMZ1ncgo8MioKwcRja5mDVPLeu4sxn9xotSfXMjEzkmjaL8SgKmxdJ7HMrypjP+cykHSP6L0vkmUO60ByLgNBJcJDEBCnz5bH2x2p3JhRZxWpr4G/zQrzyYM8dRYQi4zheonY1S7amiSowXWnGsTovd8iqk1075kTi2HOTljuZnNUZHsmkSO3dq40RDKTCsmYnjqRzfiuRAK7TOxTxaPFJg9icfko7fQycAPuC6b9JvEtDuPl2aqICbjGEMsxrG1UE4eBR8e6NsgFenVkd/Jt0g7VZu3EJPFbD8O6R8LzA51HJ5qq8fZOTYYRR/sTd8//gQW+3GQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793865131; bh=M8ZnozFOGbTYUVcfRE+lgLdEHOqbqI2xJSocsj65u3x=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=VBrjsXkG0UNfuSr8BvMJE36usQgn30RNxYX/QtjVU0L9Gd/Fp/lQyjVEXvrQiSBEQSMLfbKwQXD9/lS1i9gn3l6dX1OtxwxH0qntR8EhS6x2vCjBiCejsXT5v5uir/pEghM2KDTmqFtGdoYs9DzoGuusIyloU/SQ3uK0lvQ1K7V51hTgsXBzx3qziQ1ZRjgHS3HOHSQFW0vVTwxb9rMSY8NN9LH2Tp3941yIvEwR5vEK98Y9Q+B966vRPwG60HJ5iiAPTea0zj/C6mLZ3dyCWLSe/eN20+WGvndOo5HAkykI21ZkVQouEghcdjNktxr7mTfwwv/C+e4wTwiY7PrhLw==
X-YMail-OSG: iQs2TvcVM1lifoYRSAfcPdAMl4tyLVibb5G53VjK4NSStyenauoTwAmz.IGQeps
 yvwkYK1JpR7Dp7b1DBV36.Se19Wuac5GPFB9RTJWjlamiadoEhw5cE5YSn1rQNja0zWa86dmvY0y
 wjUBO223EtN4z8WThPWwBb7ZPSOTrEX0.9i_l7Z_DRmWUYcnEM0omZK1yh4OdHIknH1Y4_kioKZm
 QV7g686ubQaUEHHVwgJ1GrrIELdMqeYo2c.jVoAQIUgMmsZSqHvqwSr99WnkDUxq7gjqtb01lnfQ
 jU755mbU2kdpbJoxZ0w0RlyXFqiwwkq5m1.9xzYOajTQg1me19yzLBeHE.Uay__yGowP0eLkvyAG
 HVO57TGNC7wiBRJuIEt_JM.PoEaNcuwtItq__dHKeAyIXgkFblXzOfANAcKRGt9fx8J3SuCRjskd
 zCueebPsJ8L4K879o8m0UsW0qHYCg0zNATHUj4iJTbhUsTVa1Yo2go0kPKYAXTKRstT4TdHcS_hi
 ZSWT6MKB8nuikeBpurufV724M4mniAyF7eZBkB.nS0CV0_3rvrgdvb9B2AnOgl3WwwxVAvbnxI9X
 dhI3Ma3bGDRSE9edKznOVU9.cOuF0wGI9b76fYEn5tl1c8ELOdLyQplU2EpuaNQSplvqpK9n_E8l
 oxShS8WbjVxeXR1ixQR2JEWdKAwTVy3McZQ80MgVKZS0.m7cPQUnds6I2zJ56zisL4lMPxkHVfcb
 cJ3eT6aDZ95jamd_91fpqYwzLKX0rrYhLwG31n9kjEHmVxJrmP.BEBafv_w_JO7Sq_QW2RVhpGUK
 THlctXnHXusEWXH.ceDVAKrFEB1AkS3ah8Qc4pGyo3qArNr8X8A4c41FqhOq7.KvOnQo6pEP62Xq
 FOxKA_C.mc0Oz1SEgwoZW2f2tj_XCtMfpY6KpqAjfwXJ98UnVviuh1ulAnUywKmcwEV8bkQLjhlH
 LOx6fwbvgaqjjcEpgkBu.yzLxzuA4y6YS5y7Uzu8Lv4Syh2dbwq0Ykn53xNDsEUvc3klZ3ClVgC5
 ZD32mxUw_BIQqBifEcAyWhImpcxSAuwicKREQBTWtZswcqserSx3jZwBdHPnQoQzksOgeplKQuSJ
 RGTMOgM_yHXpHCUDLLSHG7M8RLJzd8pLKe27bZhAgsQsOy2YdRMhPA2x9Dec0eeJIs1DGQBwog0P
 z2sA8cl4DNtWNaxjcZsHD3s41EX.OubyvAzsn1NrE7t8CPIEpzK5eGOfkAvfq762_AayixRldlbY
 4JGcFRSrRIoueaU2jZ5QzDlIMSFR1T4Cn6DjGk6Kn0hglD9jrJdxlDcw_e83LU2HVh6T5lnm5VW_
 YtlGgKuf.oOM44.Pp7MoPYcyuzrKNg_Y8hrcavRFzu8MEcwIO6gaalTB8sA2aFXMV1ikwjGVmrtx
 l5sj4DtS5b2ZsIeDGwKiY8Qktfgapogs5hdVd7iwEBBLJPlcDBD7vWB_1R62bSo2rD9i0JZODcVd
 XKx8dNGadpEpbW7QIkn7r3bnyDb372pxjM2SWPg4XA7W4kEQ5zh4HYufMjFHaOv0mvKgPj8pI7zt
 z.owKzr9iVqm9FYiJevIYb5eZfsGF3sdmkzMjWeok2ITW2EIgeFIcGTjmZco_64s02RJ4d_YEhE5
 MjufLuwpZEvyY8qpEInHbjo7_d6hAX2mYr.6.z4dS_bVVRPEaMx0yknKlvy7isJBBWnxMXWZA7JV
 72p_0zw79m5sfhSpbtXsSR72f8WqjXlfU_a7m4x66J2_E_rP9tw.RqLdw5raaa.ZUKLaHsv83Guj
 _LTremOv_K3rfTSYjyPc2Ex4.YsNDwx90wfTVg0I6VzzePqSgqRbuRsGGgw86RBTptg6EbRguTUk
 mvu9BTxHu_G94tXb.cgW6.G1gJr.lVQBLHPHWeOQ5RyIJDHQTv4EdnS0ymY1NPumtJaVelbA4j6N
 qYhMeSSzTMP.2NHm1QJQCmR1QQZR5omXgcHs4dIenrT4AS17ssE9IQZimoCH5K4tsLloHZmugq.J
 gqlPyeDOGLg6h.pZbiFkC0q0X.BsFZF0KckdegbtUMMrpHHv6ehgIXZPepma6B9ZnVJ3Xq.UnPGY
 K9ogkKxB3pPBCCNUQWhq5jfy9rikoI15EyWweyKuTxLe9VlSIjLdJ7rd6qGuhfIJdpCqsRE459G.
 5eKZWXGNdLf4Kh7SZFdIWHIklKlIA5CID.dVCGVf9eKBVPiXBML4Z5RtBdLypaTrmO8cLQLwQl0L
 3mzdwQEYf9XEtAS6R0yx5tPKIZ.MgG9VX_60Jo9p2GYtKGLl.dZR13B.mElBP8E98b_YskOREA_9
 irXdssTXUokW0Uz0Hn_1bk_YhjTuYZVPfEp086mLRJ949VWFGS3saMbp4UZiYwGEzfQ6iYBv5Moh
 ZT9q65jAidOUL
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: 50d65b53-9592-4b73-a420-b3fb061fcc5f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Thu, 5 Nov 2026 07:52:11 +0000
Received: by hermes--production-ir2-5dd9bf4598-6rrk6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f361b5b43ce4155dcd1cef1c4df7c1f1;
          Thu, 05 Nov 2026 07:52:06 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry loop in buttress
Date: Thu,  5 Nov 2026 09:52:03 +0200
Message-ID: <20261105075203.3175-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auwswLdxTSjA5BTL@stanley.mountain>
References: <auwswLdxTSjA5BTL@stanley.mountain>
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

Thanks for the catch, Dan! I missed the remaining mutex_unlock in 
ipu_buttress_ipc_send_msg() and the other functions in this file. 
I will restore the try: label and convert all mutexes in ipu7-buttress.c 
consistently in v2.

Best regards,
Laurian
