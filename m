Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FCE48AE24
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863445; cv=none; b=Vq0mZJpqKGQCdAwpMSetU1F5Dklad7HplaLvOJAW+EinJVg+tnlq9PwKbSixohwvMptrmOvS2olH8BrMRwuxHyxlFjwHeOhvAKysgAZCgHjAz2r4MEvuTeyvxUqtpnbItKKFOZjs85C1ZE0ERUvWbzTUElY9dneP5kNCLrEEmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863445; c=relaxed/simple;
	bh=rHkNJ7QMkISfim0aGhEpH5Hm+Y6IOVsd382Lgw7YMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW1DENAgHiM92OyTLG5cbziXFi+CwB9BjsEDF1mhZqAIFFcPv4yeagymXFJF6gdBY7Rap9a0ZwRPCogidKKG49VRScs2J8RIOL9Sn4rYGfLxIasdY1Ln2+lOsYNB+TNVWK4/FSkbaKEK7+SV3MTz8UbaD2M1TDeS0KcTOhgSKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B11M9BKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWftwiKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B11M9BKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWftwiKH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DwsEk2008520
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 14:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g63Mt9nJGe3rsrmvedMjTEiY
	enXslIodcFPnj473Ydo=; b=B11M9BKtIdCSe/QmsVHWlEO+PAZTio19scMmdBG9
	VYMiHW4tRh1E+0wzMr8RWstWHamh1ySQ7fzY9HK8f/soAm6ptNJ1B/oYpItFDkyX
	kazZdyV29LIP9QF6EYEA93yzKDY35vbV+8yB9ZA8jXCm9N9UufqJK4kyFlHgOZVB
	kbXnOrkSbP2QmJArMEBiNTrU0e5Zf99LtsGwYfFkEjI9Bt45xpg/gvndHnShU5Eh
	hSgIyNfUOfzxhInsZ+NfCpefZT8DpTEXhUgcCJVSEoJrsUFuu1RP19Nfjz43D+Tz
	4pe9IVd15N8vU371o+9IglK5aJYhC/z6+h1Ozb4fMJDYkg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvq8232-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:04:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438fef603cso14738319c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790863442; x=1791468242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g63Mt9nJGe3rsrmvedMjTEiYenXslIodcFPnj473Ydo=;
        b=iWftwiKH9m02y/hapzDCVhx/oNrZYunbM6FETnYedAqzho156aXNwF6BoZULKaHvkX
         C2VJ0bBy4Bejq7g5jeoaDm4ObP3CYB8A2sx77ytI7OW2FOZOOSJzH9MWWzMdHsv9Kko0
         gs1GRoS9CblwOQLbOItkmemeZJrS4ltE+lLW/+Mv3g1IuHpV1I/yghOZzsFiGxy23+x8
         XGYcFPwYQCTF7dvmAG8aC54CtCbwAkteVZgTzBVUC7iiujJpCG4xD78WdgAXH2HUFdFC
         pKcGEAuTJkFObt9WGa/im2fqornm96qrrgpKtcQjGQXsrxk5loKj0bYATjLvuT6W96Xt
         JVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863442; x=1791468242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g63Mt9nJGe3rsrmvedMjTEiYenXslIodcFPnj473Ydo=;
        b=f9n51O5+bpR7rzMw2LdnHdsS1THkxIHPSRc7iYkqDDtwH/dT1sap+ZbTV53ClJiEkR
         UhGYfOGZwK6SidmGL0lZvpE/etRDXyyAj7PkUp4CDM3ePPk6Y4DD1fklugiXJCbh3GOj
         B7UvP11bk8hcGexahU8BfEDBFxXPEcnAylkVighczJlYOqHiVwsmcFFfANsBI/OxuxOe
         o3Dhlj6hollYlxV+7jsVfBieEb0PPbNWVGaLAVpC+TnNw/91JGnzzoqn0U5KfLFSC1OE
         Y4J36bGpdqExaHK8/iCbrjsEvpQKAFV/RR+BmQ45paUfrdadRV88mkdOjWSBmZ2uKzUF
         BK7A==
X-Forwarded-Encrypted: i=1; AKwUvBwA/b1/m6dpX9EGLzVSbyz7a0n7ASRejA1ypho/oSqF6oTD5VrEtk4sCANyvEvbbkHgwDjx2MQZpiGcNVE=@vger.kernel.org
X-Gm-Message-State: AFuF++kRkFz86y1bRYu+/VIXnw/eMT/9NDFZUlLNGpi7pt1Pjo5nJ381
	lc/nDlAnaklSm2dfXDpwpxFUCNM/W1wIDv/IoH9UwrswPVTSCHbENIif9TLThtEOJxSQBbAvg4k
	xzrgUuvFrLJ9cjyFSOSYdq0oIajf4DavHGfDtf7kGnHBraYCljskjocMqD368lkWD2pk=
X-Gm-Gg: AYBFou0j8AXCIeoBrHkgKcyoIYNT9uGNEyxagh62Ia1NqVMTPlBQOsnO8P/6HOPBc/y
	hL0mlP8pROFMOmyg9vQ9gWkzeG45NIyl1Dz2cRI+/Bv2RUpbNV6SzPui5Q7oYhOZz4BrrSIro4z
	zjsa5yr+1yXnQfpIbeQgHHq6dtSl6gzXEEOqIE/0B1ZWaD22t7p+9sIURQZOe/jQjKqzJbY01VF
	0HsvYBCEWimY1OT/vOgE370pB8N1ZOiHV14pn/2zB0VgTq6bygou7sbnk0jupvY4FCI7C0P/xpD
	kVOySJ6uLuI+0nuAqIXKZSLvJBwqiBe3lV95pRUqbnxYvPzfvLSre8nS+ee19SN4mImEtqr35UF
	RFGYGnUK0Bt3YlGGTpKyIDTQZx8WRZBozANVNebPmGSQrBQ==
X-Received: by 2002:a05:7022:7e0b:b0:14a:5d07:9b with SMTP id a92af1059eb24-14d3641df3fmr5066355c88.28.1790863441550;
        Thu, 01 Oct 2026 07:04:01 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0b:b0:14a:5d07:9b with SMTP id a92af1059eb24-14d3641df3fmr5066298c88.28.1790863440393;
        Thu, 01 Oct 2026 07:04:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df48c45cdsm6407616c88.16.2026.10.01.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:03:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 07:03:57 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Mayank Rana <mayank.rana@oss.qualcomm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: qcom: Block accesses to downstream devices on
 link down
Message-ID: <ar5oTVp3vY3hvr+f@hu-qianyu-lv.qualcomm.com>
References: <ienbx5wjdzhgtdtbmuqcc76ovzy5d4wid7x4nhq5e4bco6u4il@264db3obw2qq>
 <20260911171807.GA402207@bhelgaas>
 <aqeTyRnmsEcChW8G@hu-qianyu-lv.qualcomm.com>
 <c1213157-076a-496c-870e-cf5469193600@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1213157-076a-496c-870e-cf5469193600@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NiBTYWx0ZWRfX+4tJugy/awOp
 RD5MLh42F2DIOgnKdy3MJfYdcOi0uxe4otRU7XOxJa1gcpWIwvG8dsqZUYRUapORu9oxsxfAL5t
 ElwajjzYJ6kHSqknnDKAAVN0EXSnxcJTkUX8hJJzfHgABJNxX7ge18288nP+MWmMYp5TDSnQ9Bu
 aMUHBn4OCkzCjMuXh+xIarcL3huYbE9apZyQuhE+rjtNLKYdjAHrFWUNV3Cy7wpwoitZ550hRNL
 zL26yfDBa5+doD6AI39uLmQob7KcobsBO1GQD0GEJw9WdW9xnJyc5TeHcgVDTXI15hG9mbZTmlx
 8ERShUX2+z9obd+pgT4bbaIEvkZJtB+Mmunp8xmB59PMTtTIJOd59ZSSiejncqwqpQQnncWZEYm
 lrve9G1AtQhitnhzf6ujsqnT5B6bzje9BLh4FW6m+tDYwM8L10TmSWo5SSJdrJencsyLRRcIQ26
 YwczmVY5LvW/xv6obIw==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abe6852 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3dMp213M2K4KTSGRTs4A:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: wIPnUyRDQYJ7Fzi4tl10eVUR1Ngjfx8L
X-Proofpoint-ORIG-GUID: wIPnUyRDQYJ7Fzi4tl10eVUR1Ngjfx8L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NiBTYWx0ZWRfX9uDynfS9h55N
 s+VH38i4yL5pzjx0R8hqsty5P5+hn/Olw6mvbGOtzWPF/Hjma+nd0+qif75GDXs/HNRgwDN4HcK
 OtDeMV3BK2UsO3Hk/SFQ0P4nVXAeRds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010056

On Wed, Sep 30, 2026 at 09:51:57AM -0700, Mayank Rana wrote:
> Hi Qiang
> 
> On 9/13/2026 11:27 PM, Qiang Yu wrote:
> > On Fri, Sep 11, 2026 at 12:18:07PM -0500, Bjorn Helgaas wrote:
> > > On Fri, Sep 11, 2026 at 08:17:29AM +0200, Manivannan Sadhasivam wrote:
> > > > On Tue, Sep 08, 2026 at 06:00:30PM -0500, Bjorn Helgaas wrote:
> > > > > On Wed, Aug 19, 2026 at 11:36:54PM -0700, Qiang Yu wrote:
> > > > > > After a PCIe link goes down, software may still access the BAR
> > > > > > (MMIO) space or configuration space of devices behind that link
> > > > > > before recovery has run. As the link is down, these accesses
> > > > > > never complete, resulting in a storm of Completion Timeout AERs.
> > > > > 
> > > > > What is special about qcom here?  It seems like the Completion
> > > > > Timeouts and AER interrupts should happen with every PCIe
> > > > > controller.
> > > > 
> > > > The special behavior which is common across many (not all) ARM SoCs
> > > > is that they don't synthesize all-one response for completion
> > > > timeouts, unlike RCs in x86 machines. Rather, they return AXI error
> > > > response, resulting in CPU treating them as SError, in-addition to
> > > > AER storm.
> > > > 
> > > > Commit message missed mentioning SError though.
> > > 
> > > I don't know how SError works, but this sounds like a pretty big open
> > > issue with respect to RAS.  I don't think we want a kernel panic
> > > because a device failed to respond to a config or MMIO access, e.g.,
> > > if a card or Thunderbolt cable got unplugged.
> > > 
> > > > > Is this mitigating an issue that will still happen on other
> > > > > controllers and should be solved elsewhere, e.g., by changing the
> > > > > software that accesses the BAR to look for the error responses it
> > > > > gets when the Completion Timeout happens?
> > > > 
> > > > That would be too late as we don't get a proper error response.
> > > > That's why this patch is used.
> > > > 
> > > > > The patch refers to the ECAM blocker (which I assume affects
> > > > > config accesses) and doesn't mention MMIO.  Is the SLV_AXI stuff
> > > > > for MMIO?
> > > > 
> > > > ECAM blocker is a Qcom's custom implementation which prevents the
> > > > config access to go out of the link and terminate the request
> > > > properly. And yes, it doesn't affect MMIO like BAR.
> > > 
> > > The commit log implies that the patch blocks both config and MMIO
> > > accesses: "software may access MMIO or config space ... Use ECAM
> > > blocker to drop these accesses."  If the ECAM blocker only affects
> > > config accesses, we need to reword that description.
> > > 
> > 
> > This patch can block both config space and MMIO accesses.
> To avoid confusion, can you rename APIs by replacing ecam by outbound
> i.e.
> qcom_pcie_init_ecam_blocker() as qcom_pcie_init_outboud_blocker() and
> qcom_pcie_enable_ecam_blocker() as qcom_pcie_enable_outbound_blocker().

Agreed, "outbound" is a better name here since this blocker drops both
config and MMIO accesses, not just config space as "ecam" implies.
This also lines up with Bjorn's earlier point that the commit log and
the API naming were inconsistent about scope.

Mani, this patch is applied to your branch, can I still respin this patch
to rename APIs?

- Qiang Yu
