Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.77.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892458;
	b=YJC7kW6TaeotgYFv4yejVWXKjZgVJL1jLNVuJp6YlWQUgRLzvDzvuHLro4Ay7drQ58iA
	 aLzxL32AJwZeA4SrVXR2YmsSXj5vb8X8f/s1xguVPy+bBz2VZg1a9TpVQSI2qUYTCv6l6
	 MIfMutENAy2/yLPqyB2TfC9TkDIUh1NXMPq7DjIGbfS5wn+B6FsmsBZRx3KFQotLIdB8+
	 cKyeW5T5YeT7QswjwWbXvjjT1+K1S7KStMMblw0SFnbgSc9aoEgj/Zj9jvqGsIkzuJSKq
	 vkYDY1T7os78IGIEFEscdEOtX15/pAPPsl0cN9gh2Xpl77QQTzPrNGdUR+/pDIVh5Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892458;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=rFpQXKPlCdPMLz8JSDHkl4x+ujLoo0EQsl3KWmm/frc=;
	b=HoCKqEe3JCUnQDkUtu3ogTtTUSRvn6bBzWCLaI944Uu3Hm2v02uEihIdyFIXMkNQHYo0
	 oTb5BD6l2smaBf4t7QQXqkgtIFKeecp1wB0sU4a1yD4rGQSB80l/F3NSr/VfnHONAwR1d
	 QPqfspJfjrao+s7lnnBSKky0CeAe9LDOIpWmRbPVqT1fnmIXk16GZ63PVw3gECU84BvY5
	 eQE2jVzz3Zs/SShDOSELGEWGfQ2xVkVPMtDY+3/N/xT/pxa0CaC7Ue7997/WUjvn3Tkg4
	 3IgoVd5BbZin/wmXDbBY0XRAZse3jMxA4pQTJIbIXB0y+lp9Np+B03UkcaAPiNk26Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Nl7ItxXF;
	arc=none smtp.remote-ip=57.103.77.241
Received: from outbound.st.icloud.com (st-2003g-snip4-11.eps.apple.com [57.103.77.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00AF606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F00AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Nl7ItxXF
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPS id 77891180010E;
	Tue, 17 Nov 2026 05:14:13 +0000 (UTC)
X-ICL-RepId: 01a1e7ed-5618-7ba4-8527-1cd51ee82ef2
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794892456; x=1826428456; bh=rFpQXKPlCdPMLz8JSDHkl4x+ujLoo0EQsl3KWmm/frc=; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme; b=Nl7ItxXFhepaQv6lWhRwEVc6ywf1gqKAQ1KAVSfaE9o0SRX/17X+kfCZWRlPY6owZeFzIUrUhBEJLhSwB7xxTKLSJ6B8qeVAJUzH6oS3f/bFE/7zratCp4xykvXaI8EOITiSmkgi+Wa4jHf9EZ8EyQYRyZ3J+4pH3owv81Ov7/fKU6DuKgCr9g60k9bK4Gn+O3mJ4hRdJKuXYSA9kmhNTdt/fii04TJnU4C69XLcTSuiQZYdINMTVF/ZRYwgquOUavnyCE6R+OWeylBo9eyqpewJAneMKr2kSBcR4qKHpDJfLhsxhwt2ylcaKA7PF9jafjf6hA1qXOibuZUswffGRA==
Received: from [100.126.217.91] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPSA id 5069E18000BE;
	Tue, 17 Nov 2026 05:13:55 +0000 (UTC)
From: Muhammad Haris Awan <m.harisawan@icloud.com>
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: respect can_reclaim_anon_pages() in MGLRU
 get_swappiness()
Date: Tue, 17 Nov 2026 10:13:16 +0500
Message-ID: <179489239628.782731.11917939777323828511@icloud.com>
In-Reply-To:
 <CAGsJ_4wzsCm_BBh3B5s5K=c07bRk72kacU5vbzCbn_U-AvSWEg@mail.gmail.com>
References: <179488434239.3564555.16227252580122398690@icloud.com>
 <CAGsJ_4wzsCm_BBh3B5s5K=c07bRk72kacU5vbzCbn_U-AvSWEg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMCBTYWx0ZWRfX32TLuEe9YpFQ
 gGWRaqkEuvNxrX0574064J79eMa6YFwO/SVUwXqdJndk8icyU3o7JzNCGgk8GOzeu8MmsuXqBEp
 7kk+jmNcegl8UpyqnwlbNgBnGcKGhy8=
X-Proofpoint-GUID: eDdkUlIab-OFvnu5FlkRGTJDlp6BSc5j
X-Authority-Info-Out: v=2.4 cv=Cqcq4X4D c=1 sm=1 tr=0 ts=6afbe2a6
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=2kFROKt5_e8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kibvr5HLtuNvmma_iept:22 a=NVRLzpS9o0UsCidzZbzm:22 a=5xiRMmjtFLm18GaVJFsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMCBTYWx0ZWRfXxcTqaRNGbxyf
 YT16QBrHo87COwQrKjZWf620J/s1m9LEEz0RaUf2oEDq+F/ImnNVDjDNMZ+Pa2oeV1NoRMEDft4
 VVDk6NaYiQbK2ZfSNvr8oiJhB90iB5y4rnhJ9aWULrcjiFusy1fd2a9Vj18qicNBYzMPmSMkdV2
 wuZcMGbIAbaxfhK9exNzmQkgabaq5Ugh6eDSPR9pZ0S//mT+27G7fZqonUaVqQJ8VcTRbskqBp7
 nc5rabHmrGRHStfVsGucrEq3u+yX7sE/Brftg6f7eVDe3o0vukSGeN+evvNP2+HK2AkdmiO8JGB
 1VC3JF/mjst2gtnkO7rV4tPD7V28u11GQuccpRbSYqx5YMHGPkaNo9mcUASwAs=
X-Proofpoint-ORIG-GUID: eDdkUlIab-OFvnu5FlkRGTJDlp6BSc5j
X-JNJ: AAAAAAABCk8ABhGRbyv2LTbXCgXaKvCtkh3xi77wF4rPPWK8Yv1hEsuwLXsSGfZlDmSA2R
 79YqDJyV6DOZyk32QkcFpq1UJ8D4tVbljt5zfZnsfzBV1js6nKXdepXLctwVxEGZ8DPM6q
 3eJw0gkSFLtX3P9D2eXMaerdalrVOfDBCmxbSKV+L03tmdFdKMWgAeTZYrjqskcAbHe/1b
 OUhRxmHu5ERxHCPasIrsC6UPR2YC0vlTeo0gXNyoGPwulKyEDIjBrYjgHerobKAci5padR
 rlPcUpk3k87f++AylNZ7gOSfjUfbkDhwl0wJJ93EQnUjcqK/k5cy6lEac/INGlRHe8Mwtn
 sm8Xfn4rWpiwNCEJvBbqKpO45UAApZBYf7+DEOkEE+g+GBON28BBFPJ30gPHb7Pgfz4svR
 hmC0G9X4VDCrIq+Spu6X1d7QgZxUiirFFY+lYuDqlXMvHUkFrK4HHcTS9IVjjQrhGxJKWk
 wyWIwq/uuqt6NovWmN/VQ/YfIofoJBJB5gOX4bW9eeH/oNwqGYFEeoE54ixBtXLHp0vMMT
 x/mBUU1bZDFqlpXbTsBqR/sHb0v1atpwcrdN+AhB3kZkQgD6RFzsW+3ismo8EcEcNL05Qf
 TJpOBHfIS0WtNi09sk2/9sCugdPjLRPTWGiIsmDNGioSgG/CS3bZNoHdtquT6hbYDDrjUh
 CG5grbqme0C3eo/83w9lFLlK0RgffmJ/ewYFXR2NBNhK40NghX9K8HjbIfbaFboE2sjAiM
 pbFCVBnkyaB9sKhNftSq7oJZIWA+MJv/1Ga+0gNi1FDq6PGi4giTbCTG3c4Hfnbo64Ne3p
 kwfWJSNKRGA2JwziWLmdNvC6UeRdU2KVEfjgbSx69aMFOerJW7M9Mutp5VQA5CKhtLuR1H
 RULt33nvY72k+QHlFMbrh+t6/rrCxMxFhkjCrFM5rMmOwiSOyeqFHf1mwMuQM8DTLRXjoF
 hUDbR3dEsNxlL/tm4xBpOR74r5Ch2wkfU7nQtIFW36FgYRBuABReIFu3/eTsHgVXH/qNwx
 5PsumQf3zz4mDyT4HFqaIyNKJbFIwJMiThdbpeNUbxw6gKc9P198Zac6V6XfyvV24OMnNC
 tAXz9jsHTuHZp3umB5KcdzoFnTRiCzKn7AYIgoa/rvz5vCD+l7bgN1GaGAGCTvntKQi3sQ
 0AuFZk95jSy0allPDrSlAzQ7Xbj6yp/E3EX58Mc5o7iEdOIr6IzTMk0j8J0Zjr0P6AQRFG
 MNi5EquX9WXqnyYXPnxaxW3gnITceSkslG7bEHRocI4EozUiwD+k4hmTp3ArSwe+yFQUQ9
 f7JB/JZc+kzJu+s8VA6MDGJM/uanzOKS6jZRLdYFOMj9zl893PY/EqJbJh5e54ABs2NlwU
 y3L2viICvl7Rw4pZlipVW9bBpb0+3MsJzOZW7Wfbs3f/exQZBKRfsQH3y+muPfLortRAIR
 MfW2INNw==

Hi Barry,

Thank you for the explanation and the pointers to [1][2][3]. That makes
complete sense regarding hot/cold inversion when aging is also gated.

I'll drop this patch and take a look at your series [3].

Thanks,
Muhammad Haris Awan
