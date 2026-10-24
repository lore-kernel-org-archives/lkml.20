Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879545;
	b=rTiwso+CaPLEyR6ZGMoF+AnQI0pTIddxiru8+MKj2wiNDNF/w8e5gC+hKgrpqpmqIsnx
	 wZIdMoN46rIEXm/kPIyAjZfcGUDeViKID18XFXekHVDvgLlxO7VKIc6XRr0yy29B0nP5k
	 gKIHl33nIbLscKpPPyPPRuYsT00dFtdMVoVbMw0I265W3Fb4xzle+dygKG9ZEwaLv5Xt5
	 DDGwhhBcgcCes0Ne0G6pwI2+DWONx8PMAu/0jMYpYny3GE2HKPFi+RfnEq0BLJSyQsILo
	 t66h+0kEEbUsGHf3dLEmmpT6YgRI0pT+Dw9tnflXguxQZKTnPG3FfLFTEQep4SEv9Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8kVrNNwECi/pBgLtq3kn4zJJZjFdKtfvJtknlnpxdJ8=;
	b=QZBzayjcdRW+8f06/DVliOjd4xY46PEnXnyFbIvQWzDRT+ODS/45h5MZzCq98GpOFiqX
	 nAs+IadRHmPIO5HiQW0xO/cZD3SOVK1Cw4ruS+jsb0qKVg1s7fx65daEPLnICOIK0bY5C
	 6tsDOCA6vVE6ZdUJBuXKEdjF4rRMej7UMhWwwyzA6BlbsXIz2wxNYjqI+GjCPt+vDJO0u
	 Tr4CVxTl+OB0SxEOvAcdXG1c5o56Y0Lre76O7NJploNy0YY5H58st/B2nCsSQyX2uATAL
	 +QoE48ARWXhnJarJPIvYgFHvZClwDcpm1+AiyjWrwDetsnsrDZeS/lepRxGBLZNc2Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EkULdcR1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZAufTLC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48D606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD48D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EkULdcR1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZAufTLC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbIqq3758191
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8kVrNNwECi/pBgLtq3kn4zJJ
	ZjFdKtfvJtknlnpxdJ8=; b=EkULdcR1W7J1DWJ7fuajGh1OltMM/HIW7ISBoMnG
	1SZYxKXb0cBdx4bcHvLUUzPzuMg0RLERHpFi2duhPcczNf9MDmP4CRy4xnsg6z7e
	NfYWkQXvLU2YEXN6NcxVFy2Ib9AkhzzYFY1h5RrDYHRNz7R4xkN81FOwINetckcW
	sbarvaT7AhrCCiRM5C7isD56tlZAlokwAsavEI1exfCGU/ekMZT/hT1LtIrazsQD
	kfoUno1TRqN8HfViLUmKxWxEKNs2uz0pak0H68U3NNvJZy6S+GJQjJ2NByZqRDR0
	neUM82luDMwYuHra/XXMOkXd3k6BE4GSrWFczlz+z4kBhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgt74h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:05:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so649949eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792879543; x=1793484343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kVrNNwECi/pBgLtq3kn4zJJZjFdKtfvJtknlnpxdJ8=;
        b=KZAufTLCzpdUsBdE0S8qYmf9s3FPhrMCVxIJgdAL2D47amOoPekAFVaRGkaosU6D55
         XZFQeeDJI4kbH9QM7GAOZ24lOQjq9a5FJrau85J+WFRRZI9nwz+PUpLMPFgOyD8JnBmU
         ITLjVl+y58PjerjvngeG2yt51ocG7ZLKGeYN5J7zIX5/7Ijy9IyVGYIR8VwreMvM2gbr
         BTDMl1fBNtLi6KSkdf4hcuou7n8Mg3f+xMBDLTLitb6fTtbl0cv9i/TeILfzz0ZWJgDj
         4uAOP57G3VUiZgV9Td8j171M1xY76mZv8rrgGGVKV4x8KvQVwyUkVfFymjVcJomt8+iz
         D4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879543; x=1793484343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kVrNNwECi/pBgLtq3kn4zJJZjFdKtfvJtknlnpxdJ8=;
        b=T6j4Z2X9GoOAfpqgCDRGLs4UFzCZeNHrs3odInBiJMaBJlr/dqLPysJ5Y5iOGJ5Acc
         s1DARsrGeRO8OSvwdEaaDetJxjlGSCgyHhkPS2/qFHVUK0Y1G/NnTnaWMSc4ENkz6lh9
         AoM15yy0hcpJo9Eo3Eyd0eiIHnTJEYALI4+arQYkJifuZUn9N6hOPo2wrONCgkef3gEm
         3mufrLMEUlmPwdh49eFdXGmjPrf8DOSKFPSVoAbssAd4o1+7Fp+8yWQBBuXHi0zwn0qW
         nwZDsw6DUzxsY4hW5NQPwdbD+adddc4xCoLhmLL59l2jVnDlcgNPie8kF8dxNpB5WMx3
         wSaA==
X-Forwarded-Encrypted: i=1; AKwUvBypvAV26SPXm0Uj1VUl5cwM58xiZzoym9Hg+aUH+POHs+/7eWMf5u/yrlHO2GNwI4mKqtaTJVWDKJ6ALiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+PxEjboolBJOrUMXE9ZIaJ2IaCmS9urPn6nbuB4aNaX75OIW8
	7/PKatyxDxbjv+fP7pqYLoyd2IISHHjGzpGvcbeYugNjuoz4RJW9PDewfJgsYwhCD4SDx3zk9Oe
	bO7y0Rs5ufOaLRFHNb9IW9dS45KY+ntEzfHcu10G6FQOoK5kNpDcbykyZ8+/UaS5bD0M=
X-Gm-Gg: AYBFou1+pO+mrIwM3uPXHZzb1dP2+5ijTb8+/jyeHtBix+7808YLemXe6vXFwFeDeBK
	ShpboqdqhaS4nyYt1AixBhe7LPCbQyugUA8ant8CnX3psJ1z6GvYfVVm9b5yvXlfDjfpQaIRNL6
	2OuWZyBhwC2++ywk25wlmQvtyPLTD1Y3Ws81ZZV/5YfS3g+REx16MyePog31OyITi5IvK3An4YE
	rjF++ZzvZMW0qS+4x5nbKrEuYCdMu1IhgAAXUKtFthXvvwfHUQOrZhXqxxYQNmbVGb/xIv+GXB0
	CcXHfgr98Mkr3ZPcfXELjeclvs+bf84wCMtFoCs1odSbVxMY87X1Ad4H41C3EPaP6o5ks/1qJfQ
	2ayJqGyDa8cFjJP/6HWajf9yZfR4Vuw/VCOSQsc48+z4rdAtd
X-Received: by 2002:a05:7022:4585:b0:147:a685:912d with SMTP id a92af1059eb24-1993580ef4cmr5550178c88.29.1792879543063;
        Sat, 24 Oct 2026 15:05:43 -0700 (PDT)
X-Received: by 2002:a05:7022:4585:b0:147:a685:912d with SMTP id a92af1059eb24-1993580ef4cmr5550122c88.29.1792879542501;
        Sat, 24 Oct 2026 15:05:42 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a277b26csm11055500c88.18.2026.10.24.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:05:41 -0700 (PDT)
Date: Sat, 24 Oct 2026 15:05:39 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <at0rs4parlHFGI7k@hu-ashoraj-lv.qualcomm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
 <20261020101048.00000186@oss.qualcomm.com>
 <0817615d-5e96-4a3a-b39e-3e5d1b88e716@arm.com>
 <20261023142621.00007051@oss.qualcomm.com>
 <20261024003917.283b890d@foz.lan>
 <20261023170405.000060b8@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023170405.000060b8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4OCBTYWx0ZWRfX69bq1edzxcQH
 6AMFCCLte1xaxg5BzKn/f38OIXfONLmkJynp5U5oYsBEn69/qCD9mVIbVYopv1F9wOk0I9Ux2rt
 fuvHy6gFScpL9oWVhDBHvhsuYlmeNRE=
X-Proofpoint-GUID: otZ-F7dPBmNJkFwobT95-WfeRfycvqqz
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add2bb7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=6KC3CYklt-igK55gTzAA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4OCBTYWx0ZWRfXwqrteGMzDkju
 wWKqJPeoR7bS3KjQWUj7wB2rjtKlu6RoGxfEms901MSYgy3E9aEVfqOTau1/t8CyxGqG5Mfmkb5
 M9ip2uB3tTE+91xD8dhGKtoCdCfDuOHJP3EDuMvYZqOjY4MCh7EJ3C9NmQH8eYCNwVKO4EWbbzB
 iTA+eS9mApgrSaP8cadyiuyWdZOo0u0UN81qFG9NDEJH5OSblSvhulI1A2O0CV9N9KasXfYo8dt
 86I4e1QkOKyJ9UeT9clIVfo0eWD5LbXI6Fo1kzzgRqI3WI1D9+9sNRyYlYmYeS2f+c8ghXm8fWD
 EvSUqV/ili48PbTxfogr/voErzp/Aq6ScPMcsRjgR7eAxRd8C9rXvntLojXqc/oKcvS9Kmc8eNT
 Q8WNfFv5A5ujXhCrqJt9TrorCRZQGeoRAqbR75iWoK+GtUggoc2HxolZpBJQ67Ph0imoQ9BSQog
 k2mmR0/Nxiknu5m1VmA==
X-Proofpoint-ORIG-GUID: otZ-F7dPBmNJkFwobT95-WfeRfycvqqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240088

On Fri, Oct 23, 2026 at 05:04:05PM -0700, Jonathan Cameron wrote:
> On Sat, 24 Oct 2026 00:40:33 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > On Fri, 23 Oct 2026 14:26:21 -0700
> > Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:
> > 
> > > On Thu, 22 Oct 2026 09:07:25 +0200
> > > Pierre Gondois <pierre.gondois@arm.com> wrote:
> > >   
> > > > On 10/20/26 19:10, Jonathan Cameron wrote:    
> > > > > On Mon, 19 Oct 2026 22:38:39 +0200
> > > > > Pierre Gondois <pierre.gondois@arm.com> wrote:
> > > > >      
> > > > >> The support is mostly duplicated from Memory Error Section handling.
> > > > >> Other than differences coming from the content of  Memory Error
> > > > >> Section 1 and 2, differences in the support are:
> > > > >>
> > > > >> - v2 do not rely on a compact "struct cper_mem_err_compact" struct.
> > > > >> This structure was used to support older versions of the Memory
> > > > >> Error Section (1). This is not needed for the new structure.
> > > > >>
> > > > >> - The compact version is also used by the tracing framework.
> > > > >> To avoid relying and propagating a non-standard record format,
> > > > >> through trace event (cf. extlog_mem event) the new trace event
> > > > >> prints each field individually.
> > > > >>
> > > > >> The last patch of the serie was only build-tested due to the
> > > > >> absence of relevant hardware. apei_mce_report_mem_error() and
> > > > >> arch_apei_report_mem_error() implementations were also removed since
> > > > >> last version.
> > > > >>
> > > > >> It will also require a proper handling from the rasdaemon. Applying
> > > > >> this last patch without rasdaemon support will silent the reports of
> > > > >> Memory Error Section 2 error, cf. ras_userspace_consumers() check.      
> > > > > Hi Pierre,
> > > > >
> > > > > I'd slow down a bit.  We are mid merge window and convention is normally
> > > > > one version a week or so anyway.  Better to gather up feedback from
> > > > > a number of folk and spin only one revision to cover it all.
> > > > >      
> > > > Hello Jonathan,
> > > > 
> > > > Ok sure, as the v1 was reviewed quickly I thought there was a chance
> > > > of having the serie accepted quickly aswell. I ll wait a bit more.
> > > > 
> > > > Thanks for the review,
> > > > 
> > > > Pierre
> > > >     
> > > 
> > > A general question that came up in a related thread with one of
> > > our RAS architects. How does firmware decide what to send?  As far as
> > > I can tell firwmare has no way to know whether the OS understands the CPER
> > > Memory Section 2. 
> > > 
> > > So options that come to mind.
> > > 1. Firmware must send a CPER with both Memory Section and Memory Section 2.  
> > 
> > Please don't do this: this would require either Kernespace or userspace to
> > discard one of the reports, only if the other one is there, which can be
> > tricky. Could be done more easily at userspace, but only if some database 
> > support is enabled, but, at least on rasdaemon, this is an optional module.
> 
> Good. That confirms my view that is horrible.

Hi Jonathan,

I agree that an _OSC capability is the right long-term solution.

Firmware should select one native CPER format based on OS support, rather
than emit both Section 1 and Section 2 and leave deduplication to the OS
or userspace.

For a Section 2-capable kernel, we may still avoid a second GHES notifier
chain: preserve the existing struct cper_sec_mem_err * contract and give
it a lossy Section 1 projection of a Section 2 record. The conversion must
translate validation bits and clear validity for values that cannot be
represented, rather than truncate them.

That preserves legacy EDAC consumers, but cannot carry all Section 2 data.
Updated userspace needs the native Section 2 payload through a
full-fidelity path, such as the existing GUID-tagged raw CPER event.

This does mean an updated userspace listener may receive both the legacy
EDAC summary and the raw Section 2 record for the same firmware error.
They are two kernel views, not two firmware reports. We should therefore
add a shared GHES record/section ID to both events, so userspace can
correlate them reliably; address and timestamp are not sufficient.

So _OSC solves firmware selection for old versus new kernels, while a
Section 1 projection plus the raw payload handles legacy versus updated
consumers on a new kernel.

Thoughts? 

Thanks,
Ashok
> 
> > 
> > > 2. For whatever other reason a platform knows it doesn't work with old kernel
> > >    so can assume support in kernel and hopefully userspace got updated too.
> > > 
> > > 3. We propose some additional discoverability (quickly - code first) to ACPI
> > >    so that it can be a negotiated contract between OS and firmware.
> > >    Until the OS confirms it understands Memory Section 2, firmware has to send
> > >    the older one (or risk the record not being understood).  After that
> > >    negotiation it can do what it likes - probably send the Memory Section 2 form.
> > > 
> > > Option 1 and 2 are ugly at best.
> > > 
> > > Obvious path to me for option 3 is an _OSC like the one for generic initiators
> > > that we discovered a need for whilst implementing that years ago.
> > > 
> > > Anyhow have a better idea?  The above doesn't solve the end to end problem as
> > > maybe userspace still has no idea what this new tracepoint is, but at least gets
> > > us past hop 1 (so through the kernel). 
> > > 
> > > If we conclude _OSC plan works I'll draft a code first proposal.
> > > 
> > > Jonathan  
> 
> On another note, Pierre, any plans to actually enable a path to the tracepoints
> on arm64?  Today they only emerge from acpi_extlog which is x86 only.
> 
> We definitely want the richer data for PFA and obviously for userspace nice
> to share tracepoints with extlog.  
> 
> Jonathan
> 
> 
> > 
> > Regards,
> > Mauro
> 

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
