Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351374;
	b=gZ/NyhIeBpdOfGol1XAFL0pOoxQvSWLwfzFxz3lmnR1mY7K/ZwUMgTvCOn9u2x9qORSQ
	 l7RF4TinDVsjnmcTjnraIyPn47FlCMeJubEmzbJ6lmyjlFTXdeXcLZpmR+IuWOR8CjUCt
	 v3AbvBZBMWt154Q3hHpOwltIGD2r4G0DA/xhZRu91EKNXZUic6r8dUGT9KbXeuZhDFsJ+
	 2c2WN6DILXT3l8UMpyGLoO8C5xWtPsHAp7k+SJjPTijDlZYOin5xVRDIiSIZUd366DDVU
	 ZfTxmIHu/PY3UpjUzrIvWF1lZKmDao50+vhN/IlX2BrtNqNBeier19VIXhjifNCC2vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
	b=juZgAZ8aK4IbgE3kK/it5isTqV7mvD1tdHkK8XUD+CeMiZvSvmacHlFjy+klI+31eqVH
	 u3Z8m28S2IH3IWHPFXE9B3EXRoMpS+ioe5SQcbqg4jS6HDPWNs9lI97C5138AQJTjVwrP
	 F+/0Rrv3eY+zK2oPcIbZd+yuO5KNeTZC/hbbv3Yz2GjMezMFZ5cX54CP8KBod7KsuTRKq
	 QyVOSBwcpfFuVpitfH1e3G9wFv7rL0j5ajFT5lnnaee4rQMoNqQHWIWzjOMv+hJJtVaPD
	 UCsCo4qCPQe2Oi6MfBc3m4qD1dk8EwKvZc9sKrc2Deus1+RdbwefL46g6IJXlUZN9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ov6BeQNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5KoheuG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A1606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ov6BeQNz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5KoheuG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMLmKV3062986
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=; b=Ov6BeQNzTntj9HcW
	wbs4O2yz17+nev0I4Zd5vxZlzzZtk9gqz5vw72UU8/FduBZai+HCNmoZocFCUA5s
	u9rb+1OyEbTBlNF8Cmjd7PNJN+KlNR8pczs0gRhBi2F4HNZpak+794p2jD563TD8
	I0yjV1Pw2o9hIjrxuFZPJ70za+rgiAe8ASscdlTOqbq0paRAIBO9qY4DuCrDi8c6
	9l7AoNMDmJZru9h8CZJGq+cfZuR1H9N0oje+9uZdjfwA8pSRNvdZ07EE94zB3g7C
	LB3uZ+nA0hq3rbqVOz6za0oM7/67rt3nYpyOm+GxVvikxiEY2j96ba/3xIomdfoI
	GMy+5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b30ryj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso125885eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351373; x=1794956173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=E5KoheuGMu/1v4l6p/P8PKK1MePjq7B7iZ8axetPCSs3x9f142Wy8e3KlYejrOcMXK
         N0tbHPF06vhA5DhHNzxwiGl+DER69VcilOZkQXObgRMqChfo4KcfIKNJKvCe36uXAkHp
         ebPeTaFPYjKikxBZif04r9NVXqh900LXs0jjafBBASQnb2kNxIZ9meTLGbZFfhHjQbww
         2lzD2IXSQl2O6IfxTOob7ZGiPtpBvDJoSAIhwKLSzjIDihjYKI6LV+oeyPHVTJ/G2jiQ
         3JsfbD2PyuEHOqcqF1i9zM7lUlFkd6l+0nqkOzsdeSzjxIk0YBz7LbbEh1pMmxOcVrZF
         zXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351373; x=1794956173;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=hwSr1jwVBsMn5GAqGsqtQs5Avcy4PnOfUplyGce+tA/0SNhtFv5Cc482FHXR0Xa7ny
         76gen1Jd6EiD+sXaD5+HzKbhBvgecIIKzxvU/zMGUjbKo9uHHEWDNkuCswXItQWepsDh
         Wazh/cyae8TKmbnvuSj4SWvWhlVukEQF7RGJQtDHwqTl43NBzwCCGkihfguAWX9BE/tJ
         9fJ5kgbUTCmkBRHNXn77DJ7ELBQIXVSyAI/9frcVxSK4YiQfYAP0hyQSSbSsYOBGVMH7
         Ow+CYTGLGTNgCo5dtHKwSTasIx9qKdTEC8lbkfaRipSM3QYZYVuBDhcAUO7d48iE7UhW
         dsFg==
X-Gm-Message-State: APuU4Z9zzKIkJiFkG7MsDDxsAJY3+RK2dkM6igtJN20g3lZLUT8Qxs4d
	rXuZRF5WQYpcDkoVyAv3ZR14CxxBCUoDi5hgHgR5+9OMLghYEYgOsQLKqDCczJUsuf4ugpSx3Qj
	dEyGLIhQOfhLqwT5A6FWw4vXjKZznqI9uDQmdXwdWA4L1M9K7gWSxsAE2xNPKoxiVd9U=
X-Gm-Gg: AYBFou1m0rfojVAH+PN9SVOlvDonCLLhCIhmw5c5pgP8r63SKlGXtG0HwI0+EiRzmIU
	HkhAYkf42hn897gDXpfXsDSMuDunQg57eA3jZ+No5VmMIQeNtk7DPcKXnU4nPYkcULDtba7FdfX
	a/hx5ZVjOsY1TOQGRn0jF3avLoCTbZHzBH7EuM8JOlsihrRavCUtTfHtThYFbAkIjaKnLAiTGIj
	uL8cw0zd8Au8vphSl2/pGuXTUlaAum3Ptzfc2fCFGy17Kmq0BrYb+cl5Cq0hzCZGkvxfwLa9ACv
	rHaf/7NhwyqGT9+kxzPpL4eZRbOY7/uY9FRfNH0wbeKFmQdvbKQ+CzAosqzIboNkUmufE27z8YE
	0Csh10lWTgyQxwdBPc+VNDQYW6Y3qV8/EZWuZbGyzHWvp/eLRPPbhdyisXCI0cvOe6/HvMaE1n8
	CMRfjlFpyC6acqyKGNsuafuOZSXhE9
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135976eec.16.1794351372654;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135938eec.16.1794351372085;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm8943607eec.13.2026.11.10.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:56:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:55:48 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 26/35] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Message-ID: <20261110145548.0000663b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-27-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-27-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3a10d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=Z4ki0kIUKxbu2UUS7qYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX+IKkuVRmIiE+
 mxEWmJgV47eUyxzlc0p4Oyd2Lp9fie3Yp0WK0blhrGB5QFAcPeFH2APwSL6HZkaKPQ+H36t469g
 +xFos3KA7Gxi7w3nh7QT2u163FQwvmiAHijCOuNFrUg1BdHxqVsUko59qcVwjoX0lP3SewNz7UP
 0rYG7sH/rPwTQ3x1WA5+b9BztKx/FMPMZzjb+wHbq0UVzAE+U2R1EOIchpKCUNdLYAUKB+eHod1
 0MvltKlq9kE/mXiUq2wYP5gNK+ZMvLozMejx6+v8TFM36fP3advTEJOG4J4SQ9bmbtv22iYaPvW
 3SRvvwwqd+AQMtWHRVwLQLXbz58Zkx9Ao6q/ETtLNNKLNs3lPzloKgdcW5YVVxutgxsubyKDdLj
 Pme7k/bKUOy2OMGkM3Q3zEvoIxJuGg7z+ZjBWUkJSLS8aA0+kvuIJa8ZrGSuxef46Zx8+xfBl0M
 Y9GdwmY1wq2k2QjkmjQ==
X-Proofpoint-GUID: QpaYPF1g3G1THBBjzSN6DfApK5ASCfG-
X-Proofpoint-ORIG-GUID: QpaYPF1g3G1THBBjzSN6DfApK5ASCfG-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX8TWI1YENlLBb
 g9XDH9rreii23xvPYAitZRvnS5hHq9jHFhB8HBP0MKpmTphMLaJF3iqfU9v6y713d9a3EqJYn1Q
 ZcX9Il7GnTIL5td6ruj+UmMkk7ozuHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:12 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add description of the debugfs SCMI Telemetry protocol ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v5 --> v6
>  - fixed typos
> ---
>  Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
> index ee7179ab2edf..edbbe360321d 100644
> --- a/Documentation/ABI/testing/debugfs-scmi
> +++ b/Documentation/ABI/testing/debugfs-scmi
> @@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
>  		the currently configured SCMI transport for instance <n> on the
>  		RX channels.
>  Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
> +Date:		Nov 2026
> +KernelVersion:	7.3

Overly optimistic use of time travel.

> +Contact:	cristian.marussi@arm.com
> +Description:	A subdirectory grouping debug entries related to protocol <m>
> +		for instance <n>. Each protocol owns and defines the subtree
> +		of entries rooted under this directory.
> +Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
> +		order to dump the latest snapshot of each SHMTI memory area in
> +		binary format: each file is named by its SHMTI id.
> +		File is seekable and a seek to position zero on an open file
> +		causes the SHMTI snapshot to be refreshed; file timestamps are
> +		updated after each snapshot.
> +		This directory reports SHMTIs for instance <n>.
> +Users:		Debugging, any userspace test suite

