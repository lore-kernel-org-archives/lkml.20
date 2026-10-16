Received: from sonic304-9.consmr.mail.bf2.yahoo.com (sonic304-9.consmr.mail.bf2.yahoo.com [74.6.128.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C137FF43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.128.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162275; cv=none; b=I0YLLKqlaDNJePIEo98NdQ/juFfmMYmCUu8jFnIwP0gNF6slJ0dAEqapTgKYJpm8VfbHEM4ZE+hbuj7Nv4GH/mRwspu028ktaofdXeRUJPrdTHl3v9VWg+a++4E+Q0A0825yMRqGBLfUshxaBqFEfdkkWYVurIoDiJMzRqiCGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162275; c=relaxed/simple;
	bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9VuNdZ80LAD2u5iznMT2F8Ei+88Bfjwztrr9mH0SdrOs5T5Rq8ga3Zse/yJ+ba2LC1vbLaCzqnGNehiGd1zqUN5Nx7B4U9b0HFDARXPM7PUhL1T7i4GkeI21o4tgnb/0MOnl/nWHobmmY9xibEb/xU/1Sb4Dv+ZChNUQHuKLR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=CMU6lJbO; arc=none smtp.client-ip=74.6.128.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="CMU6lJbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792162267; bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=CMU6lJbOPyeOfn+nUG4dlHi+cEcBMWttBFvZbnwSBeGBOczxTXHbZfdZbHQN3O+vhocg8sLD+S0BbTpMLS2qzE183bYy9WwuAhcdMjRu9jTlkiAYssaStMmWNLih/5TEZs2Wa2bfDTv1eSpgq6jlrtsfRd1gRIBL4S1gozTX19PtvRGQLrlt1lKBLq9nqoop4il9OVU8xzyQCffpPRr6PWPVW6KF4ZxckD7loxfnIGcqzGk24VQ07RIfi6WYfjOSU0HLflidADSFL1uvRs2XZpfQGNgz/oJlBif3Odpyr2U7kqZ8WYMjRFKylYc7mKBSLrHuNhUTmXITidxF3g8OLQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792162267; bh=k1s5pbM3BYwik+MplM79deh+fBaPzTi+7eFide00suW=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Bt4i0VjP8ILGMJzfE6YgvxDiHl5Ii0JQC46f++3+TYcuVd7JJrzLuWpdktPSC5RXscbpGTv/dIuGBMoZ2xh6Dzr+qu0FIjyHIveqkRUFGPFRrtf7Q+gjhmklO2TUfxQaygSJHOH39DkHIpFfFbIWLWbbEkqMsIJLz5Hrbp2LhKbAfafuHlDk5RflF3q6PUf3zUAj1V4WUJVZ7BYfnxSQunhIYpDhti8XrD4FGvbcHMh8Mikt6xmIJW1YfUQ4MWgrP6kydyHPR53t7PIvSGCqztcPBvxFsgDS5lrg3w4GpMcqAdvJgGHXlswMdZRcdBe5Am3b6U98j3hFE2tvKJpBKQ==
X-YMail-OSG: n1Mfya4VM1nGrGYFEft8nn.mBaJ8Uoihi0LSp_.mfDP6hQpJrNgQbEsxP3gWOhf
 n5CAOI.m2Vq5LMlwuoT0csdgndpyhDzPUQQk0Ms00YoGIwbyY0.dAkhVHl9YOzdrEHlDmdfWWjdh
 eN4hm5XfjgUI59qm.WwWH7AjEBrdY69tL1SKof7BuQDnUaYhtk9w686vo4yL.bV9s3n9i_Vy5a6j
 VA6dsw.fcDxidPBT31XSW.7SXXJ8ok3UtR4S0vH_33o.ByZzZ85bLuF64fxcWSd.W6Ji0v_5YcPo
 Ek4_ydVT2zXqrrTK5HtFR4dw2DQpW09.NCkuYv..7ep6Lo7M8aYAIHfh3BRQ07lyCedDcpx7PaTg
 Y_j4ErSi7W7i430DDySLIpbEOSR7XyV5.64p5ORJmbRiS7O50KFYa_WblsFjcM3_oZAOk8qswsGW
 pq1UXS5jNu9pIc5Jat4YJxkPRQBVCicP5Xyd0nSm3JLyyZM3Qtw3Hy7mQ3lzqz29vnpgc4hxa0_3
 r7NjIR3gq9pUo178zL3p8K6NaJhsy_iKobvVFiFcIAxhneMky14CVU1KcmSVGsmDb33Mrn9pkFA3
 DPfZjMFWQwY.YekE3x70tF_AidN5GfGPzW6130P0yqqTemfP6zKoKfysnzD4ujvatI58j5q_6vWK
 qlkWR20BIEHP1zNCdEtbYrhi3SoNgirsponleagky5qhIowVh13..26lBiB5RGQ6OhJTteJQQBDj
 X8.XQ3.kKLHa0EEmJyA62cg15mGK_C7fM.Tmpx6L0OSCFWwhubrxSa_oEF839UcloN4bDCQTbNEt
 fmipU08m0XmwkuRyx5Put4bXhbkYbS7KxQilwAcUjkNFnv5xn0hfja31_yGGFeQUkkOpmXutK2hG
 zUWuDEHjM8cKc9aCvCUxWyJwaud4eEsQSHGRbT1pCHE_jLtHjk3hFvxjL9QrB43GCjRjmiCobLlR
 KC5umkOTLyLAT1HIeGMrw5.B1_zCyPiQB7C9P6RPX0Mu43TVLIY2mBZtvjF_PVvULsdXaEtUUJww
 xl0Bwkv4HjXYsvI_oGpSXTFFEHv6kNDRmq1ZBK3pi6Xqm4F.6RjS9R.hgjG533nvvf1pVTcpyi3S
 sTvzeV8sEG5TmlKHhrNN_1RwEJo.rppIRXyprpDnWzjx..m.h4nzNPaFF5ah2ImXxW5qA4.GD0sW
 .eZjXxO3G0NVdwT9YrHTXMJkTU220MjHROYOn8x_purrd4WH9BBCHyiiHp_bhfRfadeUl_vlv0fZ
 jYRuwaLiYqehHezZpswC.AZnPHtWd6I2u5lVfLfoaEeEiQB5tWFi863DZr68tCH1VmWyEnXG.j2m
 iqUhlXjKighQNPTOAAVibJnAiymzTdb0oaE2cdvW4mSdyQ_7Ha2hydCc2lBggHz0SC877rMw2FFG
 Bz59vsGoC9m1vJmPLnf_ELUW929t7FWUkz7pxW.jYqp9RLbWdzuxVXSBfzLpszY0XecMFd5pbnJL
 .rBIVAHogx7obrKTr5GfYYaDEN4xuLKv7y1cMeOy8Hn76zo9JKfmR7hQ79XqvYgEejIRy3wYaNcJ
 .IMMZ6fT3RS56oX5M0WoPrSVllOup9RYXhEO_ViKbJGIvtpua1gMibS0a7srWAQeH.vpg_RrIgwh
 7rRPqQIFLHkW5Ftey2wNmzhXp16YgKjm2Ywp9Sk99ZoMyUCBqWHOWhHmuzlfBkNo8njq.q1zMzlx
 4mg4MGQeXEUNP2thh44bNqSr1SYfxWeCSViJLaV6sq_kH6A.eQFY8DquX1yy3JYGW5fBx_dscuV3
 rfVZD6ZA22Bf37f00fF_DRGEIQZ.88qW_OGoZGlR6ek1Xg4LIY49aA_UntVundSXvPF0xlSdQU5b
 rhXa_crini3oImp5Hl32o95Mit6plzWUpKo9MZo7vZf8jbTISJtZrBzUa.XTFVE2VgTqJyGym0eg
 DvoxxP2FAIZmtLyX2xq40_rEWO3.dKRc5zoYSltDEaSh5zuk5fAgBCi_6d8.l4l.799A5yZIB9ZI
 ZEE1vkQ4TQ3H9YFnwvjbcJ1AGjh2acMcKDzDTlJh.dZyDZoEK_rlsDWXdylZG8pp1oGtdvHJjYyx
 .rDDNaAZ2SjMXqaW2vMUx0tRWCXpcHu2zH0iO5NALNUcEwimIWh0jfp8UUh8TVt1Zk4RLndAm0nX
 uHMs99OtEB8GSg901xwlO3FqUPg9W3IpDhaGBfLzBy.cLjxi5DK.Aul9eJnvTd9mphk8ReVfgozw
 3L04IhbdBJrYXIUnChlU8myMgz915biCWgcUFJrMF
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: a65e7184-420a-44f4-ab9f-f168ad4fea2b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Fri, 16 Oct 2026 14:51:07 +0000
Received: by hermes--production-bf1-6d6877594b-5rl8z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 552f51fa4688f4e6400648e072be024b;
          Fri, 16 Oct 2026 14:40:50 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
Date: Fri, 16 Oct 2026 14:40:43 +0000
Message-ID: <20261016144043.105294-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
References: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
