Received: from sonic312-20.consmr.mail.bf2.yahoo.com (sonic312-20.consmr.mail.bf2.yahoo.com [74.6.128.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142833839BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.128.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078327; cv=none; b=aYL1WiCAbooXui52VFSqdIlquutnLH3xzpE5ICc8cmb3AxZ1L16Lc7egykQAXRFRIzPhNC224f2eI+I9OhISZr6P6yZ2QsDf2QN3Uegszn844JaGRkCKhn9xUDQ2Jtm2gW3Be0A87hF/vnDqcZ/bsxYMsogzG9ULZn+Tue8mE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078327; c=relaxed/simple;
	bh=M9M7zOQmQkYGOkMWrdH2QspMSeZSeJ06qdkyZzzpFhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOvfDoz2StG8XZSPOTXZvY9Mg4nuWUKD8erK7DNlICfZmICesVu52ogQR+gucmxsdKuFvYtuYgQRDIYRTAanJzyWHMJaWRGE/I7FbdTu8+HOvzCLkKpNbMSwQOytnkhlursBF4steAboL+CMANyFSrq7tVe1JcpDgFdAa6xOXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=jMg7Lnb2; arc=none smtp.client-ip=74.6.128.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="jMg7Lnb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792078302; bh=WRNrhbxLkzzrWyLokyZnRiZY3hTeTC3VyX/eHZY7FLo=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jMg7Lnb2r2RHZdVueOMXbinKyjRWPHKJ323hPMHwWQvAFsBvR265Srz3BAd53emyRh1oF3dbD9n/dra6qaS8s1gh/42ve/hYE/EVYn91dps/Qdrlj+e1Yq1RBxiVc8rEdDalh03KymHaOIWkbXkiZYeuRTHsqWjk8Jlm2/e3UgB0OL3iuItICuv2hWuwCKrquxXfgp8e+tp7p6Lj2chyWFchKxxVVUgqtDuQJJnTcwc/hmgvPrulMjRGiDq8fIuHXl8YSJAZxf9u+cAb/3iqDd7PNM7PVpUl1SQKiCreBtlsWGjJndDX2vx3ReYk6XyrP1MfO+JJd/6i+ea5wlNomw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792078302; bh=fB4zMO4G7Fw3GcjsvSRGIdYxtd+vDN5eNMf/DIJsLKL=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=W6esSOqSr1rKVWU9FV0Azk/MIDUQ4l2RlfX9u8f+W1boeTd48tO5IughQnlSJ6sENs6tDIbxqLvDm+qeywdNpjxVXMQ4Usv0TiYokr38h8/RxeMcZnEKjhyxDVn3atP/YJnvGVoJyF9cqZDfrI+Sk9LMQPrjyZ9DZRnMir2/vmw7YT/hk+psjIrQerOEIMq2X1pCyQCfqFetrpq230JX+hK8A538ID2pNZLHStTkVxnCHErsr303EJkkZoo1vSAT+gPPWMAbTUm6OPTJxWtZs4BTK79pyMpxvEvwnXoYV+13u4S31kNEJNw/cx+3arIYLB/O9eFkU+BWOzQpTpQt6Q==
X-YMail-OSG: _nRTFgYVM1lNeV_KkjQyW.4uFuUU4qhQhVRaIV7NhTKsmAUXUflD7bAAgMb0RQ7
 s_U0qlWr.HII5e86wiqi7l4Bbz2GjQZ_2hSAEO7_E7lylduBhd_24vHgVMg67Pz70mcFr5wM.1d9
 QPw9u8w7g6C1eMfOjRjL228bvyCb7BX7DzpcG8hIJcRSaiAG8D7bSKh8iabGAkG8J8qm8XwUwQYa
 EKNwjhVRlMi5Qpwjjvch3OaOfCx7f593VfD_EgGbZOxmKyTpNk_Zbz9zIl.OfOm47Mbj2WVMQBJS
 0WvYMCZZqDEBxHG7Dpi7uymLkY5QAzmRWMM4EBgk1kbiJKZRNXcNH_GlHSkCV37nrwSnw0a1f__F
 Zm9ByDOJwACSidump6NOsBUFK8CrCDYRujAwXRk9KPV_CnVWz349pXxdTd9Jwagwso0DKavlV.6j
 nOD9h3EffFIZPFcq5CfpHQNSnTCMG_dDo1tlBFAfCSnTzqy6kHvopcvu0EkZ5TOps5vB.dEVZ0Dr
 FEcOh6gP6mWFdapz4Mu7XJe4nda92A6NroRM4UWphoibrsX6Jo_081e6abQWXPJy6_pYv8a.xRla
 v9c_bXpltdMPGTYzRIG9v3M0fBAVreOpLCmVRblZxCkd.8yYTKolhV82MhwO7pW1iJdgvIR0Hxxd
 KR3wnRqzR3fOP9gu1nQxnl7xR.7dEOrajUgPEJXbvLCcoWFLP3jB40xALxy0MpxUgrXDBZjdLYAu
 zRu2AgmcUzp8ci9sBbmgyE52IPwFb4HTE_KJDo9F8505yGe3Owo5Y5uQxAMW89LJEP5L3SUIMqMY
 twHNyVoUGhhwijup7NmAC_b.QX15ffbugPtERrmgHrwRzHACiYx5._fCPjk347ryoRnyz2zqDFVB
 kVmnfcpNwoA3UyPVTvPfMFsqciC3V7iq_qkx7X.xWGQn.tzOGRqiXRt2OKkTHHLG.maxPEq2DI3f
 YFi1UMHvutmH2Gg7sYj_mj9zeTpf0BQhdiuTg_tBwLvqL_mCnOitxEQ_9QEBtLFG7S8HMLTshbCC
 sp_yrprhpdb1KIDEFy6RpXkkWI8P_XImCQdmqdQ6Y6UFiHe_nthPVOjMng2GRpJtK00FvG64sWYp
 HRp5s8qr4FPcPVmf7PTfUnc.EEUYQ0QGk4uYhD9TMx99zOQI2EYNemGs9sMeQQe3OIxoQDq_Jrr7
 yT3Xx3BUaMEIoRSWXG.L08fyl5_BC3lFiAffa1JuWIociGSZO0WZFzBZUDZB2JWAfPjW.H.8vLML
 t4qfw2nwq2vuKao.DVgc5Dq_c4uDgQhT2t5vD7BVJ2Id8AqEcZRRdp9vzNHamawtKwzw5g6M_.fO
 ysAkneMbgbtgoJLapjg_87x6ZR4zXPQf4Z9LgOe27Ol6_2t2yGWm9LvCgcoZtfVedpoiYBxtDsr7
 SRk5Fbbk2a2pdRV8OvLirE9nXkDUgkkawL.gsXaBWArq0UIpI_d_UM55d4OjUWkh7DePeEgEDhXH
 fuHXOtMyUkrOliej4J_2vUBl1YFgdXXPKWzRSceFNoUV7scaTgz.nwpK54z1PX.z52vUHwW4i49Z
 VofEoci04CqNbey6iavyGWrZ8PjkC9SWVjE6CnnXPqLVkgSr4wcqclwqpdhUCt_Rxihla8f8fLrg
 pmBbJ11qW7l2FXObviGuTxYhOQfTrG.W8yJ1WFeLiH3HK4ON7toWe.c0lzfo9dbWSJLoO6caqmYq
 qJN89mZyjnPv6zSlHusL7EyegNsFC.wvFrPfq69lPgXxhDewoqxlcQRydX4pWDxRHXJySsCONXr9
 OlpWDhLAnWZ6IQhl0cs.YlweoOqwZE6KMwyvVtRGz_f5Lu_F7UtFaD0Vnahc8FwHQZ.n145BboZ_
 v9s9mAd51VI78A8rsL7QdUQ3fnktNBZNA8LxRwkSygpux.h4_7NEzrMvWtFnwJT_kWgHJRJBJoQg
 yMHFkHTc.a126j.zW7YlrxpU1XEy3aOfhX0yTfYlMsKJDCFVdmBG9cTUOyvoLpXakxFyRsX36d2v
 5v0jIRywy8VAndNv5.BxP3jkDmELujxof4R0vFGxYas5wQ6M6FuXMxHTy.OcAj04Ymb42R4vBfnh
 ouklQjp9ZABnvfBin9U8GRAzLB7XgT6lgdVATHSbuOqV2mHQN17U7Be2h65zOkAR57NT9MdVZVop
 cXW9lI7VGACCxNl5C.mj.Zxln3GxS46DJmoYSthycV.w5LJ6IUoGPV6F6fnH95HeB9RgZIIf_akT
 Ivp.6vgZHcuINtkzw1W1XJBl52_pVz1Baneo_LZL59aZciw--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: df0eaf9c-3a32-4799-a633-99c37d849236
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Thu, 15 Oct 2026 15:31:42 +0000
Received: by hermes--production-bf1-6d6877594b-4strl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0512adad97c05b08b5c7a443da9f3ed2;
          Thu, 15 Oct 2026 15:31:38 +0000 (UTC)
Message-ID: <79c3d3cc-2edb-4fb5-9328-a5e689538a82@yahoo.com>
Date: Thu, 15 Oct 2026 09:31:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: Luka Gejak <luka.gejak@linux.dev>, pavankumaryalagada@gmail.com,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: error27@gmail.com, ethantidmore06@gmail.com, dennylin0707@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 10/15/26 8:11 AM, Luka Gejak wrote:
> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> 
> 
>>
>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> Remove redundant parentheses around the address-of operator to
>> follow kernel coding style.
>>
>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>> ---
> 
> Hi Yalagada,
> 
> I'm just letting you know that this change is no longer needed as the
> entire staging/rtl8723bs driver is being deprecated and removed.
> Support for RTL8723BS has been ported to rtw88 subsystem.
> 

Here's the patch.
https://lore.kernel.org/all/20261007102819.19904-1-luka.gejak@linux.dev/

Jeremy
