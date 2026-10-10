Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4C2E7378
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661701; cv=none; b=u3DJPA2lu+0+8ABgXH0VkfztplhJsHqI5Zzn1QotmccGWjiz6Yryf+rFOtPrja3bOCT8pSy07xzGoL/4T4PhbviPotcUd1wKR4t2mEGx6OGEMx2lF+42uljpuB0sHTgAvXecqg3LvOSEnC4j1a+GA+sYYhpHjmzL4KIddpC7Vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661701; c=relaxed/simple;
	bh=xwjbSYgn6KXQ9wka03ZWzOM3dY+f7vtWb04ux/4AmUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoGTD2RLrYJMBjvQn+smITpsqo7dtux4cCQS85kQdvP5yahGZfWoGRcrk1dpX57hVjqqiYr7BBcHprnDCyzj9+HJxUWaI6S2CKPVrITGyAK6kUH4oxOXQiKlJWhX3CAPdyzd4K8vi/6RqT9RP+Q+I6kI+iJWx/z+8jY1FF1c0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=XHdeIRzU; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="XHdeIRzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791661692; bh=xwjbSYgn6KXQ9wka03ZWzOM3dY+f7vtWb04ux/4AmUg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XHdeIRzU47TA2nE6H2kWJN4Q38QqijLWtt3UB7BryxUKx68W8mkXULI3rnBN5cbNV2Zg2klAllx3nFbHWpcRtSogZ/06T3mBLttjOjEkKK+RmNtVPSe5FsGvO6zOHoHqm3jC8s0hv0VNTL3zVWNn8eiut/0ZExcGClUpBhbV1Qa+bChsQky+amy/TmPycg38iq3HCMjIbUbUqX8lHoKWRHvulIcEoMVr6BsawmUtQVGJjNUcYTMuAJPrqb91qwy1YuhS93fjioJx8/8MQuyjpOtoYyMtLuNH+0IsOvm58SYNt82yVD6i305LQdPfHuMOYXfcBdHMPxHSjE7QvdQ8Vw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791661692; bh=zyF0s22dNKkUyPihgpJh7Hjcw6kq5pqR2h7F5UhGnPJ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Fo8U7Us8Hsv+MSJSrt5i4ffDZrgX9p1JWXWKzcXPiJ9xPHvko4f/0PF58HmFQxbBHhP/ganaaatEBikqZGsCrVNvpfTm5SvC1mbk5PBKov4VBAAPnFepeH2gvDtdqEraDHBDdmmQDNrUsaXhnbxbw+qA4vvwhFQNbQcqKrrt1yviTfMieh/+Hb7ATuM/sU2rZlpUd3twqrAimzZCb4fmbvJ8SbYsDKHYrx96TEGEA719WMCW4YsQt/KzWyCcO70fG6FAdLy2iq6VD4Ih20nxADLDIMzqy6CUidtj6fel7SX15y5/0+lpWjMsiRMvCQp2ka7KKSk9QpN+tAizOttH9Q==
X-YMail-OSG: 6rQKzBEVM1nWxOL3GIDBNLJqYkiNN.Q.52v.rnfxY5oVukunkkhyp5xOoRoIO6Y
 hg1tIUQ8M2VzswZeXWC3QpSvuAnkzCe6Z5Al4z2bk466jIHWmMLXwcsYmsDOEX2qQVeQqUTysmVc
 rGUB9pU0YkHBr.WaIfCTfXvSmyULVf.EZk0_NBWjbhb1GmVhohBDZAUCXrBTTMYbuXBj6Pcup9dA
 pwgkzZb9HrYl_fvgBjNCIwy0slp3miP8Oolx70P_7FCY1XsSS3XggmOv.I_WKWKI4LyLNXHjF1ti
 RrKXFu1nkQBuu3KO_ndltGOQrRdj2WTVvDeCEroVEfvF9rwnLm7Rci8DgHV38c_4tgaidUYCNdoy
 .IXeCgPPy7zENWuoeoUoKNeV_TWBD9qQgPdKQ5L.bORRiiakOBkEhd.VvF0.lB7HmvcXmrY1Ze_Y
 CL0YpiScehDa1Ww7IGWhlmrPr4tqbmyb_Am0qJbbCaL0qDyjJwR_Ps4rrrquAGY1L6Ha09lviOSz
 h4wy9fc6XaRNKnCdjCK26GiZaQ1NU.EfGRaMKNZTSB0MRgxHbH3UrMXVq7EhufSnM_Sgztcmae60
 PRqbypnD_oE.1tuSqx2xdpebOFbcUt_cr2Ngu0t9l8FYF55VFwvgt5AupcEoO1KFdojcNPCrHOr5
 F_1H0c.DfErKa06pLDYpkgofBf5STSWe7HZmSuQi9yuSO68Cifh7EAl.V4W28ga8l1bJAVczeHw6
 MrMEqYP5ySOPbI5PbPAZAJFwPNZ1OPOQZ2sPXc0X7FyWG85KzQWWx1L42HKyqnGSdfKD1Cp4Gklv
 s.yjyIFWh2b4TbpxtU3d3zpT8GHlJsUKEe_JAsvtoQ2JfQ2hSWZAwUO7kZkw3wZd65lTrj4CHSs7
 lFAOazCwoNl5BPyjQT5arUxpI7cFmLg8SD1Ki4BFGimxD2VdOplmG7AYfCn6ZIIwnNh9Y.WCC2YD
 4WHLmarLpHKhy_3j3OYEWg4fMJpOLH6c.fNT2r5y1s2oNfWAHPBA9BuTgqXE4W.v3agB2vRSvCyK
 HdZY_dMYUfLw.fz7yPc3qAH7ih_l5wOcBVIiF2sOLgc7WFCDcU4j_aG3otUjCQd2XQYWfM8oJDU2
 2k__lCD7y3R57FazAtodBlKG9v.Qp1GEHeX27JCCgyanHa.xQtlOk5vc_nv6lhPwwSA2K9GmCbhG
 SO9kXqS7CKH0KejL1gKzdIR28xB_y1QDCxgG.R9kWV1Wc.5NnGUUmu1gOVz3bfH_XnGe95DZkCu.
 CHDLFU8Gm8bSoUeX9K7HPfLPD7YaqlOPGU5mawJ8Qs3TpijlXNDI1mDMaXwBH_gGJzAJJW4CpsDh
 VaoPiI6hmns8SNP48u9B0IPIOJbOzGvVi3V1bWz.hQuDtsIn0jy6OABCl7t5ShvPzcKsUi19mjuW
 GisI1myvV5iwVAio_W3v6N91CZWXI7jp3T0oBmvDw9L.DRfKnxK7S_wZhuNqzvgJaTjfOE8k39kE
 gU.hV518xLKdBECCwCOV.ZLJQlvV9M7dufaigCBvTHzdEpl8JDqi79DRb95fxjsELVSmZX3fyT0O
 HQ6xFqzykyx0ne_5IaR0XlTVsJ8392LXP5llW4w.gTj0fFiLqwUx6uQS4iUS6HaCo7m.3dt1dU48
 3zdu43.3yYOptPhBnR5Pyiidgz79bvhJh79MB.lDqQuTzBC_uaMW78jLiuoQ_aT4kIh4pwI0slOO
 czpyosTFFDjj48d4H5K4KO4D39C7iMttTUBHfXSB1WYxcH83Q9A5x2MDiAvwGHXuYgbA2pwQxX7N
 y9xnYPnX6Cltz7Ws9bZbIBM9nlTdxYv8.jXgsVvZJi6ep_nJhLMte1z3FkO3yysYpXmH.nGNOLQZ
 XFnKLYguTo54NKRG.bQ1XKhJPZVUqggR.2VM8W9CuoyTx2b8BLKpaqy4Bzy4IiSQnNiUrP4g5HZT
 pNFNKEkgvNyVgckZbtzjzwwLhUHPC3q6H0Xh4PUx7AjmePNCxgPqeZQS_Xv.PVjHuNTW4hX.S2yf
 azHhy1WHlZHZAZx69T5iyCy0hLr1JS9h_ODXqRMcjucV6LzMgVhBAhzfwl14uEvCgWO1nScsAMWY
 seahDmaOQ.zIolt7vWJ92fq03zA7uKgtihlL8CvPCnv_1l20qXEA3S6zBsFeBe7dLXiB4i86cg1i
 dFHhB1OmXcXx1g.ntAGpxT0qFtHNBwOnkN4TgfHabokOEDx8uMt6OBFaeA3dR77TdfFyQU12OI8P
 gVHK.nrBk91kcU99_zbwH3lS6drTGl0Gz57ysTybFlKMRqnBv.a9x0vVdz4rXU79dXiVLxdie04A
 pcMMp.tKe1aUEdYlyQlqYiEzJhkytmNlH4HkKMNQVUcQlpfZj1HE-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: dfd437aa-a2be-430d-af91-2298abfa9816
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sat, 10 Oct 2026 19:48:12 +0000
Received: by hermes--production-ir2-5dd9bf4598-nf4w7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 07f6395ff3499c6cf6e6a1a81cc87afc;
          Sat, 10 Oct 2026 19:27:29 +0000 (UTC)
Message-ID: <3dc433ad-f0c4-4679-ad8a-b4676cd7255c@yahoo.com>
Date: Sat, 10 Oct 2026 21:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 8/8] net: dsa: realtek: rtl8365mb: re-latch the
 family D SerDes
To: kernel test robot <lkp@intel.com>, linusw@kernel.org,
 alsi@bang-olufsen.dk, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev-bot+sashiko@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <7e3518aa-4f99-4aae-bd9b-3984bdc4b548@yahoo.com>
 <202610081722.Zoeli0ix-lkp@intel.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <202610081722.Zoeli0ix-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Thanks for the review. The issues are valid; I will respin as v3.

pw-bot: cr
