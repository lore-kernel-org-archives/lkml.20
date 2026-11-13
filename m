Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582301;
	b=nGzhtep2XJRuJZ0hL7S7K+TdS1Z9gvC6ductYWlm9M0pTwlfg2n6LBeJPLXvjOFHUBcx
	 2sT3rE6dn9hlMiNSCh9/JzFSx0khFz8tiscD+p15INKX0e2QPt48rUfVZaY9OXQS2KoPi
	 QBOpa7iYya8qRtquuDaz5OvW65jlAzOcGq5WJzaRrRBHrx672WUUiDjMsruTeylQ1MOui
	 jirdG46XFYXXlkcO35xx66C1VY+9aZkIFJevJvsaBM33wc0FHOeOQCDKKj6vFGcaGIs3L
	 QhGinllFbbPg72fYqzkGxDvoIC3YnC+Yilew0S/WfH9j5ubO0VTS5c010N51SVqj+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
	b=leHzRarY0T84lA1yQcenEmo8aNUUW/+TYm0s5Kt7P2hDfxWowReFn2gNj1v4JggfpsVf
	 7BKk3FQxwgkLy9+qn+IAFBq4D7VQ7CefTnMqjIxqiRjbRnZfecIp6u36tN8aLU284LAcJ
	 4hDeoz8sLEJ/okNeXoOS8LOcUIEQp9lFtivYy5tG3t2zu+9nGM74AlpyR0MN26uLC7D1D
	 drqbaBu6IYxY/pgSY4YcuMyfoYWBw8W5YpCmdNS8wcgU4zuQ+dkWroOqYeM3yj5SL1fTK
	 Xr2EbqpuAhdqBCMR2UTNL2U0Dwa7p4q6PRR1eFG7LgZtJhtp0G+UNwRsH9er/d20OXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai2JN6Wg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b3jvtKD3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCD606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCCD606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai2JN6Wg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b3jvtKD3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKfvR583981
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=; b=Ai2JN6Wg6D5WPmv8
	r/3AltXCMnS5XmB7sVjWFHvOwG7pnZoQTJxCBDln5vN7b8MglhD4UKxxGJY62WGM
	mXPlYWwoBJbqSQplVl4aJdQuGnXubcQBjuRzxsEKOxRrpUTWfv0LBdixd2YpAp7Z
	b03GM1lOze/nnzt6IqDSiNHyUrxM02ynp7EmWqx9ECgmAvFluOec52+W3FctGrcz
	LBDSYX+ufXfhJ7jxuiGCy3Hu20O7fzUbAeY0q5ZkCcPaTlx17OnWHoMCjeYgPVnO
	EWCkuK4g7Al79PUND7wIYXkq3mZRjzL8S7gNiSJrJy7EW4pi5h715PyeOjZuDQSf
	Lfe6pw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0am9d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:05:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so862414b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582299; x=1795187099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=b3jvtKD3K6MQYEDyWs9H4d2LWci0eGpm49rOx4H2UCCzJzQiz8eyG5Cq+IE06tIod5
         YSDrciDapd/U8CStKXUDYmcO01ewQMj4wyTebBOD1NKDJ6+8XJ4qeTAOElMoiomGcmQR
         J7HZbFt82eNhPXSXsX7lpsPTF+ML8+Hj0+swCij08yhdRq5rBzBmDKnPQLUTsYX4NAob
         h17+/yigCRF8kYGTM9RcY4oalZ39aUsVy0IcDhwhOb1j+W87OrQX82WNCPyI4MCpEbWo
         Zucr3i2DC2ztBk09g1hRUXrYgH6pGxNL6y8NmuhdmcrFzSygY5Ui1ens+epd19wz0T8x
         B/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582299; x=1795187099;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=jxWMJbBY18txKB89VhW0zenBRYpEpR2b43HmeASIk33XtYqwjl9ITpEkQv8EYYIMbJ
         YuvEuLYYCbP6fxUHLaLuDpHv/Bc8v7A9/avMGw54YMtjJD9SHTt/NHtioIuWcZnye/bp
         GlK3ZpB/I5m1StHOkt+l9DFd+Aeu0RHgIc/kPppiAO5x6IlXkoehmRzr268HFmWNsMZc
         +HzAJxzp6bFpiIwWCL+miVpCe//sEH78dlVLXMw95EotERqwG9OZWhVM2pReNKIr/GgO
         D+eY3WIJ02vBdSsNG+FfcgaPRMVTaeWPNl6Pk1e/BJZP4RD0dO1mRYK0CliYmkTQfbHI
         +QdQ==
X-Forwarded-Encrypted: i=1; AL+hErEve0HY+S7vUgZIOavDhILaSu/fWFPvcUzwVcFZS8KNMOsr9bYaKFpEKGZ8DfC4V7Bq3oF/C6KZ2t8uYcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PWRh6iUFvOa9UXsdyW0Zr4orfnQD+hQV4GSX0nsRB+pYqVVmQ
	O8NuwMChb3iYTP8+GN3vizYPCdDPxToRDmTZ033lk3+UnLlnFlDtC5DjGJwENH1Eb9YobfEzl5B
	M8DhqtWKQ2NXojIbMFo5dIeTs1jwymG070dtnGL7CQWJek9V8OSo1XJQm+pWjgE8iBiM=
X-Gm-Gg: AYBFou2xvnw7Fo7TfTqR+GjR/TUw1mph8xB85zLkG79YPA56UUQAi+kaYy/PQG+kmlM
	y093AIyi6hzZl9SHiWZgupN0jqvCWxnClM9NfRtwQT1KlFLVG42n/6EtgNQf8d6Vla7u1q6aYi0
	bcENz+i9sONyDwSSQrJw6DSekVVVhAsWf66durzXUGLCHK7xGMWOhyM+gOoiXBfz3v7bapNCYsj
	mcs6+mMfVuD5rTzE8HPwxIgmx8b4usf3qKIZNxCQ/AK1GX7d5vWXgMjkrlOXfUp7nAMIUOhM4iP
	k8hNnVus7vJ0p7vITYmBZjp/m/WYsH75Ybzxux1jhlVD7+TOBALtmJCBtG/2CrgF+60xcjScWz+
	6SqrguBJ0WAk9wHy7bey2z6W5oUjCNS9Ktw3PawODmzdS8vipUAlasDTfTilbauOBvFpQMFD457
	l35yh4B5GU8Pkz1SW90PigNDfRslw=
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808139b3a.5.1794582299082;
        Fri, 13 Nov 2026 07:04:59 -0800 (PST)
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808105b3a.5.1794582298485;
        Fri, 13 Nov 2026 07:04:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243ffb6sm1252199b3a.43.2026.11.13.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Shunsuke Nagashima <shunsuke@nagashi.ma>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx
 completions
Message-Id: <179458229712.913702.1338158233604985110.b4-ty@b4>
Date: Fri, 13 Nov 2026 07:04:57 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfXwATAhOzTY+FT
 xRyO8xN048CghmN5ELCAAWawvZ3tVJOznUR+/nGOzegB6vrQIexIjPzSnSCJj6NzdGl050aWmfB
 GvdDJqIRenihS8h4bVIMj9d3ICUAmuM=
X-Proofpoint-GUID: WjHnet_HcpsxURdkyU7Iv20aqszfsMKq
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af7271c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ALV8Qg0lGWWfAH_4w1oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfXy9uMWp4Cc1VT
 JrAk9OYQP+DlZ2hz5vw2wh5AgXd5DfHY2oeMElUyRjfFSDEJoXh2bd/sI55jQnWWUIjuSlKOEtw
 6wny+URuVWmBBzxWeh6lwUgInjuAgY/FD000RzzbLagK4DXV9/vuwptIh9rWdSf83+Sabbi/tOl
 3HckhakiddyYPoc81CLkcgPrtud7SiU3Y1OOvuQhk9rkos8QTy/nQi5ze60IOzVIjwLhDNFvk7i
 cluGQIpfsqv3C0sNn9je0yNFqeENDs5sYmyANLEt1LpZFhY0rfYWpeHb4OcaHHmM7Rvg1xN26cE
 bJnY1jYP/ALJfugTEMwAgJ1RZa7cN3jVGjtSWDtykn6qxeKbeDTkpULnRcw0hKG1xeWo81RHxkH
 VyXZVcmKorF9C7Ssq80kPBFGe+I1o9y6D2/btdJjxTqsWJo4rIKF3YHecgZQ4sAC1+HUsPDwxh0
 RPgTWytpR6VYc6wXsPg==
X-Proofpoint-ORIG-GUID: WjHnet_HcpsxURdkyU7Iv20aqszfsMKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130060


On Sun, 27 Sep 2026 21:10:53 +0900, Shunsuke Nagashima wrote:
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
> 
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix status of bundled mgmt tx completions
      commit: 51222df62c7af2f0f11ec25c9fa8bcaa0f87fac8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

