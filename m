Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EA49DB85
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162777; cv=none; b=d8uKkjGgWDa9vCH5HOgP/k8hyV/R5k1O6P7QSDzaNaQ4MWPKPjgqTnJxNtPkRbVISoGPXi8A0gD5pPs4kQM25WrLizdWKqUTh5gyFDNmcDMck8TewkXez4yBSg32M6JM4RwSxqIJmlXrBvrx32hK9TQa8S8L7b167UJW3ZlEDfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162777; c=relaxed/simple;
	bh=wAz63z4vM59cDGM6LsTxL5BGIjXCM3agwqWGM65/FGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dHCQgDKLNXVJWmZ2KEkhiaEchDeyD5yc1nRFck2m9bSw1mpvlom8OuGOORThZWN9MTf6wMwLft24d521+9ONoRp6xxPv0OMX9nBpeGauCaWx1T0ej5AaLpyU13X8fwpVpeQ/4mjlyYrZH4Sp97JL/XKc6Rx/yb7eKeZi3oyrMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDCAF+6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRA9iwn7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDCAF+6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRA9iwn7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NAm4YG3663752
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=; b=LDCAF+6PYMGDa1hX
	CZho+8P+RdrJLHQuAcRrSndkxfxHFu1MLaYZ4ZtNGpefNEW2/EHpm7u/aiG1C5SW
	g9HQyleQkbgaCGn7QyLaBjkT4R8G5IvcDCrR2Iuu5Cpy4UudLkXDRqBME2QJBUFe
	6rEIMlxmoSPQROr7w/vbCMH6MBybl5F6VUD+S+9KexpQvBwk4QTVqsNgyLJe+qko
	qFLuIMUD7PGiQiPFMN2pkJx6gabdI8y/+Fo9Xi7ERomhni4pYEGVu+K9GIMHRiE+
	v2ubZn/1ta1ZY/f4UKEEBBIkJOKZ8RhOs7gwfnqrzTGn7jz8h74446AOOG1CnFAk
	EEigjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb605c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso80952585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162763; x=1790767563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=SRA9iwn7BR1fmm5DN2/47VVTqE2edvbQ5ubCeseZ1myHjCFeq/McdqekyeCXz2P/Og
         8GSmZWRcXwMVLrLQRBF2q4ZixjIPwJsE6zoWEluaOXH8VD/Qm3U612X5ldIRdsKb368D
         hEQirXT+IQ8K8cLGA7LePPkSYvHnl7PWBA+BEEDwcsVXDkPS1vGBxMI9Cw65k7f8W6l1
         EdgvVUvqg1aF4ZyaiMWmnCYAjYSKTGvxOxEsSvXDdwOtWI1y9gobwBVjlOraIEn35pD0
         GZbmHXfY3WfZZiVAK2ZGNhe4qGOr9IrgFu8cWVwollehZlME4eH1jKsYqUqLIff/0Mir
         JAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162763; x=1790767563;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=m26y+iibv5siUwnMNNeSCWyf6jbP4+M8vp3aDxNSAiXamSdn7cqlRmLDdmgwJd2XsS
         YFIdVUPVPCiGPMfXG3KYMD3ZDDA1LFB92Zp7gpNzfxVr2/JvjsVQa+dJXO//TKLHGCj+
         4MWmIvW6KLdjk+NrwhgzZnTRHFr2sYTvHgupcK1s8fCJih1QT106993JLUtiuaHdZDxC
         yocGxLS0qbg8K9BE/PScBPbMuUamgxP9Z/fxiBRfXST/MJWj9A0bZ2ILABC6PidLkJss
         Ji3VE0b8b6XTJW2ik18EZL5ndGLpQy3lMDFQ7N55MgCvDWvybpcJzthLLrdPHHKLEhTg
         3sKg==
X-Forwarded-Encrypted: i=1; AKwUvBwxZx0odVrzymJZeBGDevUZtjv44o53uqAzaZSwJWNoE0n6Gfk2ciFNNtwraur4XAVKnbJ7qTezdrGHGl8=@vger.kernel.org
X-Gm-Message-State: AFuF++mnNLSEkXEwu9lt/c69UGck6fGARtUk8Vvs9jhwiSkewUrgnw3J
	kTPdoXdVq2cOcg2VkDCcVWjebedfmrGmtBTSRP4SpZ4L70B45NOZTywBSXjo7gsRtZCOJMfTNsT
	LtX0pRFLY5xHmdJdE4bpUe+zsFsYe/qbg9UhSslEy4l55/3mGDT0v+2GrgG5HUuWfXKA=
X-Gm-Gg: AYBFou3BF/OXSp8kF5Dwgo4rBtTp1Xsfpl/624HAEcSbcc5SezH0y4EZWpIsTW9jjTN
	YpQOdnWQN9i3AaOw2KyLowiccDPrYmMZM8LlNk03kzZS6DZl3iOAH1+CZc2PYqPOuHB2vJP6jNw
	yQxRHZYs9k+qBo1mHrGDalEZX6YIzl/PNjGSPqxw+uyjYS5Kx16adSkR1orfumAgAVqK7LfoOpe
	nVAqUnZC5A2hN9jLV0FWLGo4X5ZeKMyiShlbFBj0uJd6h4yYDYap+fNOhSHUAl5BQo5EET0h/GH
	3Ed890f618xNshnbjh9HbhcGZo2gQoEMvGR4bM0wAV6AoJ4TG0onk8gilWpgPywcxjB4NYu44q0
	YPg14Z5qJa2dCV68iFN7bmjCq76b0KsIKZiFYpcOr92UD7legQ1Qpxy+of0PIX2JeqjrVoy7vWK
	rUnRNTCOKFbOVGhU+uqenZmbNGdCzxMdCpB+D6+ecayYmdK/x/eAODRPf+nXbVWJb/LxQ=
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353036885a.65.1790162763253;
        Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353033085a.65.1790162762755;
        Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c7asm100347966b.22.2026.09.23.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
Message-ID: <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FnO9ZLcCM42U0PD9c_AJipjBSWOoeYts
X-Proofpoint-ORIG-GUID: FnO9ZLcCM42U0PD9c_AJipjBSWOoeYts
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3b74c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-cZiopXip2GWjs8Ks5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX1KwLUgiWZLds
 WJGBh3EIS3qjDYm/071Reg97uzKX6NE+yUCn1IHx74bKNB/Z4mN9/E9oDACLnT6wcMc9u5u+Sja
 TTP5eUpzC9OLH0BUtbAKgzqf6/s8jfI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX5lhQtxvhXRb/
 I5MpcOfSWl1znzhAChyAhnn6iEAQ2FRGCh45Lhx3t2XeH6LtwxcGL6pfH8ihzXGXn1Pg8Ujm1kJ
 M7/bMkIC/Je99yyBXnnXYK3j3cXsyTJcZ79D9RJYb863bHZkdI5CEKdGG9o7vLnOVnT4natJGS2
 idUUX0Jul9DTX+N3hUjzNUby1vn0bWJB7aI5tYX3DZ8v0t981KefwwqMZr4dkxR/9KNwSZv2uME
 NKUFO1xmohkhmcRd+9rhqZuQxT7fNbIeBYlyBdZFKSJcNnss8mGt3TsYOy3spdEn7frh2WWB89r
 Q051+Ik5RwUcF+IaxViiL9jLwXItpcUbAZJQUQMODND93Y9zWIfyPo0OWd+711UqMIzzIVy/UEm
 YuFRujiyY2ICazOY7YLfUhWmDgJt8EnarP8PdiaFe2lGaahrnM34bXicBh3L6HyCSwsEc5ax4Hx
 ZfiULv8q4MDtvw6fP2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045

Hi,

On 23-Sep-26 12:49, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Sep-26 11:07, Sudeep Holla wrote:
>>> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>>>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>
>>> [...]
>>>
>>>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>>>> new file mode 100644
>>>>> index 000000000000..1b4ccfa9dcc5
>>>>> --- /dev/null
>>>>> +++ b/include/linux/device-id/scmi.h
>>>>> @@ -0,0 +1,17 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>>>> +#define LINUX_DEVICE_ID_SCMI_H
>>>>> +
>>>>> +#ifdef __KERNEL__
>>>>> +#include <linux/types.h>
>>>>> +#endif
>>>>> +
>>>>> +#define SCMI_NAME_SIZE		32
>>>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>>>> +
>>>>> +struct scmi_device_id {
>>>>> +	__u8 protocol_id;
>>>>> +	char name[SCMI_NAME_SIZE];
>>>>
>>>> I wonder if you tried to keep this a char *. ISTR someone did something
>>>> similar recently and they claimed it worked. That would get rid of the
>>>> artificial name size limit and simplify this patch.
>>>>
>>>
>>> I agree with this. 
>>
>> Ok, so I checked and no other include/linux/device-id/*.h file
>> defines a foo_device_id field with a type of "char *" and
>> then uses that field in scripts/mod/devicetable-offsets.c /
>> scripts/mod/file2alias.c .
>>
> 
> I looked at hda_device_id and its uses. It looks like it does use
> char * and there were loads of drivers initialising the string. I must
> be missing something then ?

If you look for hda_device_id in:

scripts/mod/devicetable-offsets.c
scripts/mod/file2alias.c

Neither references the name member of struct hda_device_id.

So the actual modalias(es) added to the .ko by modpost
do not include the name, they are of the following format:

        ADD(alias, "v", vendor_id != 0, vendor_id);
        ADD(alias, "r", rev_id != 0, rev_id);
        ADD(alias, "a", api_version != 0, api_version);

        module_alias_printf(mod, true, "hdaudio:%s", alias);

>> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
>> field, but then do NOT use that to generate a modalias.
>>
>> So scmi_device_id would be the first to do this.
>>
> 
> Your response made me dig further and I found snd_hdac_codec_modalias()
> which seems to do the magic there.

Note that function:

int snd_hdac_codec_modalias(const struct hdac_device *codec, char *buf, size_t size)
{
        return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
                        codec->vendor_id, codec->revision_id, codec->type);
}

Also does not include any name field into the modalias. Note this
side is the modalias which shows up under


/sys/bus/xxx/devices/yyy/modalias

not the one which gets included into the .ko (and can be shown
by "modinfo") that one comes from scripts/mod/file2alias, but
the 2 must match of course otherwise udev will not load the .ko.

So it seems the name field in struct hda_device_id is only
there for the kernel to include it in some log messages,
just like e.g. the dmi_device_id "ident" string.

But this is not used by the modpost code which adds
the modalias to the .ko, that tool is the one which has
problems with non const size strings.

Regards,

Hans


