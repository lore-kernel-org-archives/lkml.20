Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.129.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259051;
	b=pOer6mdRVBjsM3NmzWwVQLVKi9dyAc9qvagLBCeKiA1Id/U5azw8tBo1Vt5lOsl62G53
	 tylsOHA2gtBZlakkIJ+CCJ0med0Uur3sSnS2Cei+KL55vxk2JG7S4a0k6VqKbYfhE4pY4
	 b11MQiD5LUAh78Snxd7dujVxfdmGusRzes2biJaACrZR2LBboQfEeqdl02XXPE0LcuIlo
	 SRQYuk5vRQ8hkynY2ywTZD/mlzfJ/akskk6cXFZbFsKTYb6NRTXKgx9EuFTmwJzsmAfxi
	 seaX1TBig0GsC7CuFt5E8l4qHXRFQOzRzHdJJU13u8Z1ejgglHjKnsSkzJ51WbLRHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259051;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JEYXfU1U8URc2Pv4E4ZpGfok3ipwYXJn6tUppDNmvZ4=;
	b=zNnuBeJCj9XXhLrmiSEWHY0Nxu12i24CHwLnLWKoBFZm57R2C3WsCJ5VIdX2/4USPHW+
	 qcKYkXvtnoHWMwT0oywDxQsk+K/KQQFv/tjFIGAzJGzDA9FsubkJct56yGY4XHZcIh5nB
	 YsuN+uYBAmFyBf4N4+vkCGDQ+TY3qfkHTNR6YF7cZsVT78XZ0aKMTaybXSLqBO7bN4E5L
	 QqkJt1H91Ro4q8cO98bybxjJU3elje9gjD9P7FBiyDHr8LvQSvV7UcmRDS1RntIiJLcIr
	 NfJ9dtBStMBAFYThmWFeBvtRQvqkxb7xTMaJPcJMNh0fdWq25VROrGamjjZSPfZxbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="OlSmHg/F";
	arc=none smtp.remote-ip=74.6.129.82
Received: from sonic317-27.consmr.mail.bf2.yahoo.com (sonic317-27.consmr.mail.bf2.yahoo.com [74.6.129.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F445606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F445606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=OlSmHg/F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794259050; bh=JEYXfU1U8URc2Pv4E4ZpGfok3ipwYXJn6tUppDNmvZ4=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=OlSmHg/FUKOhRWfmKE7j8Ac2XMNl+zoEGewIx9k8o9wWrP/55uFDVjINBmUDXvKljHlbZrOkUt8NC3fV4jt8YR9vsAl5wAPd8MF0zhhqw+z/VGt7549iVGZr6dxDA5pyXdqAKQyixrkMKoaWSOMYx8uusYjc25hU1aTPq5VTtRYH9ayM6jVZGw7nwpG/pAqobbsb98WciZr1DLI2dn4namA5Fc6Sa4md414z60H2+V/qcdAR3FT8olSX7Vx/OrHRaHnmXiMWXcKaa4VNjVNCLeHf6U4h947+a3XwYzF/9Z1PtgsnFudzb4ybNxmOV6wV7VrsYf6CqjOf6CwpM725zA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794259050; bh=0+TYf67+QjJoeQRcKp42ARBIsirGSgU2qRrgbgDZkMo=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=pY4SR4AAJpIhMlrvOOomJw+hsKp3AVuyZF5jYyHVwFyDDWe2GXq1tPpZCZnp63Nfj9wPMpNh80aMXMcIl8HGSxYpViHztTNAkiASw4skLXq+kh89EH7F6mkhH496X1hdkqWhpzUoIbBCbBVeD1Q08fc6jhWL50Miz7tHKo8oscMeWkUQd4IVECJ/HhNaZ7XjLYHvXtIJAhKzJSHsltznDC52jvq+FLhWg3NqxYSIFENPstlwwfE74+GiGAjMOqSSXAI+CKoJQI3psb6pshB7h9twYXAjM/MnjgVNJinbIrhy1tTobi9wPpZ/bVhkYIt5vORcD/3xGdNJGEZrUzrLaA==
X-YMail-OSG: Tgl8SNMVM1lVrN5jVoNX4.jTIPQmpt9M9h46xfk9v.Y0QtLfdMB1wmYmgsKOyIl
 B_wUph1Ku6VoJ91I0jM9n8zIijrP6tKkqfnUUIn3b2EW1VahwXSSKvmIXdgrdcXw07c4pE.DtFMh
 h9vfV5q.FpFLwm6aBrOeN1c5j7j_BgJswmdjzSafVfU4hosYdotPC4rCtS1HAoCD9U92i87VOnV_
 x5Qr3_EXWrSr7Fm51ymQ7JIyLUhYZ6oZygsyhpm0uVMVaP4XQHDw3hTqTNKFrSdyD_ZB41dUuU8l
 kudPWk52fGw4x5nIraJd8qV_dz16TWb0afVRSpuBxf.gu3gsBCTTACpblGsn1BvE.7BXwSDVX32j
 QRoypnKipohpe1ZgBHbjDDZ5YlJP.9pBB7yOxEIRKVCfSLsT3p049VaFAUweqNG2lvorlAaAVv3l
 gQiCEZQf0rDnrKExZt_fdnPurl86me1_Vsbn9rOcInUem63Z_aeZEIOdaIfrkXsWWVEDNYk.1iQs
 rzpFlPAQ9tkzEVUrn4z7HTVHiHQh4JrU8C5qYwqTCuUU9iJl1gZx4.0Uyn.ouBiXRcE.DdXTa6oV
 7CvQO4v1SAEEM9ZJf.rexQNRFqilNwJ1qTuxEY27TMXSrxiKEVLx2NpcAyY50w02ZF_gynVI4EuR
 nsd6gv7yrzsaeqHW3DHgXvGu2PtRHai3ce_hB7H7Vz698DlIVv5Px0kbpodgOKxeBf8pGl.SCrFB
 4kvz7ojVrMH8jN.5s_gvuROWpCsy6zXfOuvjWUoceDlH.nS4Z4zd2ETh.6Gf_MzGF8Fqa.n3sIlg
 9S.lUNwUO.E7bB47cSwRRbtmTqtt7AvMVVSEF3HyPlFdAvjmVFcaskAiJU8IIvFri.uhrfvC9r3c
 VnaTce.7Dqnk1X.ELU5wAP2o1hJA2_tlbRFdQs2Fu6yDJREqonEMISU2OsWCAdq3k7WkGPzi_0lb
 JaEzjsmpd6laIpHVN3Ei0lUTF2MqYqMAcJNmmbsp_V_GByyijEskOK4TOmQdmWmc1BoaHU4FGHQD
 2VZtGmB5e.gHtncruPAj53rl88hZan1zzDkSeXpeVhhHZfZZWGh_7OHdeev80lOCJBQYYT5AwOZZ
 gjH2oa0DFB5g8iu2shM8GkF5zJqVG0RQQCTFzWpb3Ot00pc3ta36xjGhfDeiUx.gdXYVQ8CSE6VZ
 qC1mEAJZzrr5aHWpP53RydxroGbCaFeSFFLmzn0KAd0kO1eW8hejKCPLXtZc3IiEfpl8j25NJB1M
 hGAKMPklAfuWsmRCm237ltzMXmLuM8nK_14i59B8ytvwf1PcmSbY6QLqe34WAROUrmiG1axogaeA
 EvcLDJdlX_U39zrcbX7IXPY9y9kkTUlVzjtgSXksR4juifMPqkH0fYvLVA97lg5EWAKDaZbR9nbZ
 tQFb0Qw8JHhSfLf5wRrOviIiJlX5_cLPcuui4BzI6XJkViZbypDyD_ly.dfV.OOkK6SdocQf7dV9
 Iqea8gFh35fqg2Qew6pXex77nLcTijSqSTdXlcyuUTXs61iNnDN8HK0FBvTnaC3IIvAwl7Xqr7SF
 8SovI_cAF4YtQ4ORZfTyt8MyccI95N24TzOlqDL_VrnVrQ1UE9Ljt0TpUla36drFusGjZbu9ra54
 UCVVzOjEmSMSbAkSi0S3xzTpDqTx5qi9qTxGkAN6l._cUmRVhvmG_9k0GPB0IjJNMKUrhcUIkCS5
 FoMkaXCkwnYyYfd2XL2uMWJBQQ4GPKKvx6nTJ1Wtn_WFph9o1MaGkyzeXDPZWRNrwwwaCEtJ3ozj
 dtxzfLsexRY6Mlb9DBOy4beAaBz7vm0CFvovUJlwPiKl3MgY.zMYROQaugR2pSDrNmBM3L6YFteX
 CuTjtWULpapYo4yl6sY9FvEKvji36YMTPJHR2h5E.zQfuiMwIbFkpZ6o0LotzsEc4t_OlFiQvePZ
 Of4SUAH3gMJ44WYCLWxykI409ZKS4uZ47VAoBQrqipDEWomsydjfzM9kiZtElD4eOg4XjJxp2IFn
 q9DMbCQUKuxg.59ObkbSW9HI2btaLGqZ37blwe1rG0dlqW9IydbkcajWQpYdJ5wx0PwN2m.9pGd2
 wn0xUdrJ5WkE1Oi342F2TxoF9NesYfOSV_atXkuLgMAWIONZe.hDauvaKK6Pb_MYhggaeOgLYdlK
 Kdk2iX4hFGN7tgvG6NXAQYhJFqGCFK6p9zBOVemHxFPI19vphxGNKPgx2pIUUOdOsuQDOQ.CzZly
 sLVnBln9TVBBHQLhlCjcZRQ8aQRPsPZXykA93bPf4Fk2ulGzeoYFh4cIBGd0i8.0lGkngYg1E13Z
 W3b5pCkPuDz.0FhsoGtsPKbA9OV_JgHM3hO4Y
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: 1b7985fb-3b4d-4ae8-8e1a-4586d8568523
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Mon, 9 Nov 2026 21:17:30 +0000
Received: by hermes--production-ir2-5dd9bf4598-c45bs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 90404a0c6e0834d8f8b330b4d7fcd50a;
          Mon, 09 Nov 2026 21:17:28 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: tomi.valkeinen@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ds90ub960: use scope-based guard(mutex)
Date: Mon,  9 Nov 2026 23:17:26 +0200
Message-ID: <20261109211726.8316-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106114859.1579-1-laurian.iacob@yahoo.com>
References: <20261106114859.1579-1-laurian.iacob@yahoo.com>
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

This patch is superseded by v2:
https://lore.kernel.org/all/20261109210940.7751-1-laurian.iacob@yahoo.com/

v2 fixes ub960_update_bits() returning 0 on error and drops the
conversion of functions that still use goto.

Thanks,
Laurian
