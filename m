Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A83E317F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485259; cv=none; b=d2I2wMnDH7p6V+QINuZ6RLn4KAU0pXaETRjksiwxzqXO04Rsa1UmcuuZe8OUn9eou7EBiW7eQ4kVbHItVpNtZtYYbkomciF4Ersmb4dtAmfl3W0Y4dWYa09baGLG6rjufD2jM7oL9ZpVAfAuKZkI4A6TngSTphMcGVwJTdvE5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485259; c=relaxed/simple;
	bh=MTnKpk0h7QS6CV8IamE0i/Wrr+KKtRG9NnCiLdaKcqk=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=UFyktNs5RoWk/STL44PhXq3vAnN2g3dGb+ehcFdQoDjJtJ2eauVvRMOvpPOwUXMLnt8+cmSQFh5tQuSCuZjS00L3bNjc0utchlShBqW0zwm4in7cZ1PkHB5KfIMaxwYowr+d6g11CnngK9cklm6QabR/2rh4IJG8DnP6NjOBhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=FAeSAJfv; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="FAeSAJfv"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFA5L24098599;
	Tue, 15 Sep 2026 16:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=1
	JxQSh+NvQj4/E8GS+Ki61ER2ISO/fX72/U3I6v8G6g=; b=FAeSAJfvil9HuIyxO
	IWKfuOaGt6po43yHGU1JAQm2hqFF3Jbkhx4BrBlAPn6Qpg1f6OoEIkXWtKOzuiFU
	Ty5P2mbIOE2ozRnABaDXfdNWZ67iQ58yqurWKtnCN0ksUUp07uOvGIsFdxUeScgP
	ZV3BsfT79qwhITeS0n2SskdiypK53Oj79S0FWTymOGzCU8RiiORhD3ukzFEpMihI
	5ePx/tYoon/OtJPr7EFTc2sBgb1rNhaGwOcDI0zNodVxr2UXiPG6OWSqAsBRWWJP
	gm8gAg0rNcgkXMY/akIVdBG4C0NMIvQUu+mDz+n5/VW5QN6dyAwtwuAerCTXBEfB
	MrJ0Q==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q2e3n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:13:41 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.60) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 16:13:40 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Matt Coster <opensource@mtcoster.net>
In-Reply-To: <20260810-b4-unify-repeated-reg-defs-and-move-fwcore-macros-v2-0-991ae813fd88@imgtec.com>
References: <20260810-b4-unify-repeated-reg-defs-and-move-fwcore-macros-v2-0-991ae813fd88@imgtec.com>
Subject: Re: [PATCH v2 0/2] Unify repeated register definitions and move
 FWCORE macros
Message-ID: <178948522024.153878.7094621776217206336.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:13:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfX09GRaDFWh3rC
 uIOiFesfksvDPJGh/7vFAygVZaZv2yRf9fwk0lsfpeizaMp5Gpt+IkOlMvAzyxIf+Wib2qKY2nR
 vF98n+gIGeMinXxgJW3pQheRdeYPgr4WfWJZ9t0VNoyB1FsMTpBIl3RQk1LjJ+1l0EJGs/t6NX4
 vdnEE9uxTwS6GM/YXVPgVnMG8yowBlPOnjX/U2znbVT0ctfZTCFdydmQgKlXtZhQKvMwxziITRD
 kpyFBPnZx9kRs2UkUwhb/sxgkFde0EweFFDoSq0jPCnVyaB385yyeUPpGSqzKXxzZAZBNzXsU3E
 vIfxELlVdkbopqLrhiXOybzPhKRgdqSC7C0Mbic4S0sZNQF4cXHu7aweCH3PsgjRgUkxPGTMEA1
 /qWoJGdvkFVu9YEKFlUhZrsAhK2Uj70T/9Ip45lBbBXm/s1Pyx9SQutQI+kin93L1HJQ3VC33u4
 f42SxiBTqnZ5kxI0isQ==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa960a5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hVUt1O5AELcA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=_AI2fxX3oRd7GBNYKMgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: vAUx7oZChHIz7_02HyXPKY3lS4LPiSys
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfX5i/LEPtt8G8Z
 XK+38AnOocxYlROAVYgx/0R3T4d4cVz0ZO7uiPcX6iKaUz+R2gML273bcDlDFOixRELudBtgG86
 Uh2FL+QduzDJhOE3XXkdlCgeZz+EzEw=
X-Proofpoint-GUID: vAUx7oZChHIz7_02HyXPKY3lS4LPiSys

On Mon, 10 Aug 2026 11:35:18 +0300, Alexandru Dadu wrote:
> Refactor repeated register definitions into base/offset pair.
> Move FWCORE_* macros to pvr_rogue_cr_defs.h.

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: Unify repeated register defines
      commit: cf43f918de9058126509766b23622596e05dc413
[2/2] drm/imagination: Move FWCORE_* macros to register defines
      commit: 8f07803fcfb43e3f65c2e569fe2c175368ca60da

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

