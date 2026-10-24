Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830005;
	b=4d54ObkDR+ecfFLGYoJgEZKzejimLxafvMkY3rPHC/aErtNSQLKGB2tXEC3HboZZ+j5K
	 cu1RGJpe0OU/qijJuznRTtMnvNxoa8g+N46tIyN3IquVxRXIWXRoNbVyPNuLLdB7ebI7g
	 ubcPT/i5BfOZ5keCPsEvXHRmYM3UPfeqK0RWc5wGwuCZQVuLL9kyMM8WT/Ru/6zUS5IUS
	 RqymwL/HvfNvNOXZIRFOnm1ARawrj3biTzvKkI4EpEbIDAbWO5+rYAjehWdgm4fxPsKG/
	 lVx3ajAhTma5b8aZlhk2KfUmhpkzLwEmky4/ka+IcSWwa6AOHynkwXM+ClYCI3mpTqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
	b=qnvRYb8AMtdASdoxx8MGHQFZLqDfBZ75DswDSyIPcw4SXCKNXlzfgon4HA6B5CBCiaHV
	 Nk+PzQQSD+undgffPOnczNngyTIzyPi+xjxNIaZ+amlrP69YcspBZCU4TiCLtMAG0hG0B
	 QBoNG3zQylgUWMPkIvFknmpvp7td5oRwSxd9w/YZZh4J54RkJY/GBWYpCj+k1mXyNTAUR
	 63VfBgg+2wg0K/DHQrzowiqwYhdeLSVPZtriZLrD8ouk5kwQBUkQ+HbtRv9hSKwjnDu7+
	 +L3E+fJ3TXE1lvP8//5t+vJtj44/sc9gBMF7rf+1S1Azdo2RggsT+prhntEK3nFmnWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D250606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D250606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O2q2Oh982902
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G27Cz2wceBx
	SG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=; b=GhTyjEHDE07M9G/UnEBw/TGNWJg
	BJGF76rSgOLqxvmOwTzddatBU6wrde/banDq+aEdI5UiAv2hkmxpf3ZOwcBp5JwN
	SpzH50PMrnZV1+LFn1pJ4wFyjJ2swVYcbNpUq8q36Yd1E1OxTlQaRnz1P/5eiZUX
	QI0Ts8R3TIrFk76dlRJTpqKPPJ3ukI4mG/JfXD/OBl7IIq37zY+oPH8ILD2firC/
	WvezK1PPTg9LOIMODAbKkLnZ3g8G42HeXZ2gfrUB+o0gJDqtYrx2hS2C21FNNtpb
	5bHG0DyyblXEaYq0wqT1SmGEK4FB0LVjyAtaQfnkoNgB+ypRKc/CGs+5sKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xgjy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso13775085a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830002; x=1793434802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=egJTqpDVDM8ojBT5Oz/kKJutar0kT8QEAxY7VnmBik3EVH2cEng64r6xhS041siq3X
         CMLH0vn816MOLw4ux3B8sFp2KvnoUU+nFbV5IOtmFTpNSXadd5Fh1oxz88kumHc88ELP
         D7/uPXcMQM4w/oIY8QlcKp7jLzYPL06NxJi9FUw3Nm8g73+s6Z6vZ+SK2Qmb0Huk/YNV
         9G1mjnsuutgXfK/yPqUWhHku8EkPwRqdouE+EKou8IVm/M3Q6qMdJ6JhUTU4x35OSQcN
         BBJH4VFukcvR63Xy4vkXyewYnVLq1Poe3H6AWXAjNHZfFfEekVn06JCKgCanc/1Gr7ph
         9aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830002; x=1793434802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=mlkA39bwbKleeTXPqwDzIy5cWW+Qq1tpEHotgUdevwlT+X5iSnnS+Dbev5Do3gyq8N
         /DssO0Uez/RllQdOTcsqP0My88Oc0qBkHgl70BcK+1l058O5oAsi6HOJW1sH0W9xVlOn
         ZOVmFEEZFzreeQdXURtTIYRIUzQ3s0qR50+sNRfEQuvjcv9S4ux1we+5+MVCGxOWq+A4
         MbAFSUqTmv/DomVCcrz52j3xAw1rwE3ZhaG9oPu7wrvlciz8ac9W18Clx8sXPdwUF1Pr
         UeHjj6Otlq4MqNmzZjEyt8pmJB8iHdfbmV/3so5h7axGuCYyMsynq4zOKc108Xni2WBP
         ZUOw==
X-Forwarded-Encrypted: i=1; AKwUvBxjTyiPbmXbOYDWivgnJKUjosLQoUdbhZYZCf13oPF0zU1iFVYaJrSnf70o3wBCpyOhPVgPaNbW3v8dxHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdpCoMlfYU4gnoTaNZj+ffu+L61NKgJbGQesm/8Zw4Fi1YlJld
	JjRCrpEx7orbp9cpg41PxH0uOJqr2/HKZeoIG+Soe4YKbVqjYJmhAB9ReC7J8F96sN6qxrrO5Ca
	i832iRvrvTVpF3MujejiizfaL2qfhMlrHfQFJDepufeIOGqu3HhwUY2f8NIsDw4EpHCo=
X-Gm-Gg: AYBFou3N86SvuDEPh92rNuzoPCST8gmxuLWGt2y926ko/jc9K+EsVM23272kx82ldbn
	vm/gPUvrmbTC5SAyxRaumT2oKbdN/pEth992pepyV632f5TBL/J31zSUW+24Q6soXXzhwBSPtYV
	vOD1VyymhbAjUgXJUYd24OmwNGcuLsRDY7W/mdqUWlFn5bexc/sDflpVXIXVrg85j5+sQf2DtP5
	tkddi4vZb2tG1axhb0Qu4SwQgEM9Woar97mXsWj6VJjmJPfDbri+6Lm9AGW1L8+bINNidh9beas
	0w28XYmP32ElUNjsSEtiJwWCqXqu/Sq+lIKkdJuMjHNPeBBgYmW3vsiphK2eXWjl5BwpgT40FrH
	7tpezeC/unC+X/BJ5fSyt7NzE
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32782985a.69.1792830002464;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32782485a.69.1792830002062;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 11:19:57 +0300
Message-Id: <20261024081959.2887288-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
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
X-Proofpoint-GUID: uK0804fMvXNQoyA6nzfr6r6B5TkSYJoU
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adc6a33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dDcOnGmwcWcmha_HxNsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX1kmILxc/Rqp1
 rPwIltIIbMpMHcsj8iQeUQ0hKkuz42RSQ6szqcPTgb0d08v3ytMVHeo84P02V15QfqC7QT7YVc6
 mtb4CdTYUu3O2PpLeQMO2YgoYNSxb30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX9ILPwEtISEX+
 uNZHLuFolw2w1yBMeU22ntRKuUkTtqZ6XztqvqEqdxqeKxlR57Qcslk9WAXHVN/JEIjM6VNjkUR
 vDlNmsbHCuasRswLnCgTDaQ3XXRRMi1pLzdtbXKuvPxcOgDtIYZjUwhUR1DBoqm9YMMdJ81Alsw
 R1RtrcJCtfd7G1dBKBcAa9kkZ5KlUQJ1F/3DshWPsy8IGEID1TE3jcfZzpLmpcFMdbMQI3kHyg0
 UtN0Lc9gOvaY++BFrfeYQE2hEHrxZn28qtWhe0H1FPvosZo5PBYA1KIwDAbN5z8ZyXm7MdwLX6o
 rHmFAMvJYSBnA00VgbH+l5a4W8/6Jkw24DsMtwX87LEQonl7Bai7ILjShrG3kTZt6CSesZB6WOI
 Z6OPHtO9wbYZXagjJ/XfckNc1NSNAQRXbpkl/EZFrKIBgtVfCDKEmy04rBsSAakkLACTtBsiNhU
 pnNqNHoFPh9ngWnk4UA==
X-Proofpoint-ORIG-GUID: uK0804fMvXNQoyA6nzfr6r6B5TkSYJoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:44, Bryan O'Donoghue wrote:
> On 23/10/2026 16:28, Atanas Filipov wrote:
>> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
>> use the same shared clock sources are not covered and are left to a
>> separate change.
>
> Lets discuss that change so. We need to represent shared clocks through
> CamNoC anyway right ?

Yes. The camera NoC AXI clock is shared by everything that writes
through the camera NoC: the CAMSS front ends, and offline engines such
as OPE and JPEG that are separate devices. Today no one aggregates
their requests.

I have posted two versions of this so far:

  - v2 added a CAMNOC interconnect provider with one port per client:
    https://lore.kernel.org/all/20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com/
  - v3 exports the camcc camera NoC AXI RCG through icc-clk, as
    gcc-ipq9574 does:
    https://lore.kernel.org/all/20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com/

On v3 Krzysztof objected that a clock is not an interconnect and
suggested fixing the clock framework instead. Dmitry asked to land
icc-clk first, then the optional CAMSS interconnect, then JPEG. Both
questions are still open. Gjorgji summarised the two options in this
thread.

This series does not depend on that choice. It only stops the VFEs
from overriding each other inside CAMSS. Once the camera NoC is
represented, the VFE stops setting the camera NoC AXI rate and votes
instead; I have that change ready on top of v3.

Which direction do you prefer: per-client ports in a CAMNOC provider
(v2), icc-clk on the camcc RCG (v3), or the clock framework?

Regards,
Atanas
