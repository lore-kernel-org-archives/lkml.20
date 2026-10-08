Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6E3BE646
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439961; cv=none; b=LcIJ51rUi/kbwRxE9k8r8P1hPnaUwHWFKOxYfY05Xe/x1rK3fJ/TtKMf/xprUG3T1mFH1GIkHhxqN5mX5VPdYdBPiPkgcVy2RZ2P0m3HA/OAj/bENNOSAueJw3W6KfiVhl4Ta2iTWW89F0fp5tRtKDssuNl2aAfSW7C4A+W2e4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439961; c=relaxed/simple;
	bh=sCkEiN+qolnUMYJu0zZCdc1+ix2cmxHcK5i99B9vty0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGb+nrmni85fjP/eRRa1Y/cPIxw5MDTTJ2zUztVcf5jm5OK1kJp0qbZMeTjC/DGYbkBwqU427LEXeXwg54AjVlJeVpB23AqMW0g5kIPXZPd5YNPVeCNPjYakCXVm64eOnxCALLECQ+GYTV71l9vsSWlLWUGk27sMZzf+XHuM3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Y8weLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oj/iw2tw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Y8weLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oj/iw2tw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BpMB2775804
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=; b=d+Y8weLU28GSBE3q
	hyzTdHjUqu0MoG9oE7BMMVpixr0jym6chlbVLyh95W9Eji88xVsqFZJNef/DoUw7
	Obx3sfnhxloT9BDE4BWjzaggfa5zK6RhZvt5Fn5e03n1QSqVN+5L/Q09mf5s3A2m
	6m8E29+WzGV6cSLDo2zKcwsUMkQZEEKMXzGXewuQ9g3z2VwazZOJDakO5hU+J6ue
	jn353z90aVVqQKwpnSbMPgAsfI19ORNDVGef9D7QiAn2jhihcVk8Kg0GWS195L6C
	IB5lYTVH3G+1aSlcItsbmf31Dq5zIu6O2XgAXelbEGz3Fzhq7dOX5uBwezXMiGQQ
	y7YsxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69dh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:12:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so4996592a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439959; x=1792044759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=Oj/iw2twS3VBhn+xLqe412SHu3vSMaIlDzR4PAyxpNohry4VnLrDOprnC3blZ87SjI
         hdPiB1e0YxlcUN5GJJqMyHUe0PA+zPbLDms489T9mlz2lTp+tPOeKLXwMBTaU6xo+di4
         BU6FDlKt8S2fBXSgFsr9vSSA4t9uFbTTIIUZZxzW4sduDXZ3qOS/mtDjC4vEY8CtZp/4
         GRdyBPHJKXoVnqCcLMn0T7CLx/FR9Jg9RxURY/lXorMdqkh5IffBZ2SzOBzGVCalj6//
         119f5oz8I+317Ut0Apkd2O4o+Qjto2viE4Z7fZkv3rR8JLU9vNcTlS+yjJJNtoGmjmb2
         6VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439959; x=1792044759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=QlZDGIiGUamxxRg07fR2czW+/p0cEjUptiX5hPYoDD1HHyBOvwe8JJ5lb3MjWD7qTi
         jYsFWeDGQR+ydw0nI7BkxtFx491YxTXIcLmkOarqrIlcMnGeoknQSnCZaeYKa3tsxxWc
         eJACoMaQlZnIzo3YDMItIRYLA/OOYVRlDvdw2W5KfMLB4QV/D8HIfJ4dGDy+Qb8SdChJ
         9sxgE3uO5TXqjQmEhm18BNeuVUwbogD6q1UZOGmj9Z8bKg9i0OnYHEsXZjG4BK4hS2PC
         vBRpDI+ksSSmiyeKf+/5oVlxhLa25b/YVXqJv2sk2HywciPRUTElgy/elJv02tkDW6jC
         DoFA==
X-Forwarded-Encrypted: i=1; AKwUvBzVmNhgDZa8CrFNJKpS4F6Km3KRqbgF11FB1EwVE/gQyd8xog0AGpiZIK+iw79Wth6PCVcyVMrHQjsS6dk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8Mhb9pUoiPZOyuT0JjEey3P7E1XfMVa2oLMbAAgGa4dGdK2+5
	lmdOEoLm+32Xbg42bkq5DonN9tKQDuXfj/SwKTIo9RzriWs4o8lsbT6ZZ+M909gTJaFVKQRq2kr
	DwsCbI+aN855VLs/qDs57Wg+W6qyHaemH6/Yf2QccKUGfnUnBAdzaHndk9P9kk/gKmys=
X-Gm-Gg: AYBFou1YNHB6gf8wfn2GtkTAqKeny82cVnWvyh3Q2UlsFyX9Tc1pI4vStgtEufelaz3
	wog0stn2CRc/MBIoEGn73f5sVMccMTeToYZh12eaqCza7zaQz2wQjYZ+PFrdQakk9EWqtFGwjCy
	aJeMUXE40pI/VuNoxmInUQp4kMNS/DEhWLhSA2QHl8+MehodRH0Z+MLCmK8fr2p+gdJlgIf1W9Z
	EZze7KXjdrJir/9xRk1n8AHhLY/6L4ExRcpiZtYsqjJmJgk457Awe1txdUH5LLUl6DQXwH4OE8S
	FD55qQZIfooLCbHQU6+o95wJFzHU3tl0WsEnGFozp4HdawxqB7W/jqZe1L4JVT2M3cdQVGAE45r
	BP/5C3JNqKlSsvKyX71boO42kVdK+6yIE
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086856a91.45.1791439958822;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086833a91.45.1791439958315;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm2882655a91.1.2026.10.07.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <d57835a1-9a56-465c-946a-ff261d2df0e1@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HdhsfJHuJzocR-VPMzU6viyh5lWvgSMG
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73457 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0IlxrgZsFcjQ__LXY9EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: HdhsfJHuJzocR-VPMzU6viyh5lWvgSMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX5zO5F+5GoDZI
 gvU1IohWYrkW5igSi33ojXisUcLuBaAthh38wL4hdWRIN65j/4Qa4UqcS1/KfDqEifH4HY3a3eT
 6VRJasSWo90KcfiZmQCGResxzfO9UJOmNh/dO5AaTWtA9Txw0+mJJefZj/Rtobv3wixRwF9f1ia
 l9F0go0CBqE+NXfUSMzjONGHBa4CT6l13gx57joC0p3CzzkAwOfjffMoxrrCW4t7m7R9n7lOEft
 KA+GEW3TRjij2qZNGgndkTsOLfEO9CCriKVeYAmB4OCf/2MluHoPMqUUM+7vRsZ4xfp8TvAuA6N
 fv2FBXE/APJA9zME5uU4DTbGAXPcrjkMfGKjS8EBmKSStwLDml0BVLLgZh4uI63t1vP+HFKvX8P
 oWzX2NcZwAcZqFGCt/aYTlLlAMWpM0gs1d1T31OTZvCGFvsLDBITmZ0askB5ZxVfrad+KbzbuQT
 z8GYDM0+aPqPmwUQyZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX9mSf9ixu1okV
 L0ifG9MzdU2xP5HD9FbujbXrE8SE/fqlx7NUu2Nsz5wh5yMV7hQv7EY7dUOcR4PK+xax2yIvZQ7
 xGhATiuDTTjbrXmnhksu39Dyp/c43o0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080024


On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the Sahara channel is torn down.
>>
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device:
>>
>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>
>> The sysfs read callback serves data directly from controller scoped storage
>> and protects access with the controller training data lock. The attribute
>> lifetime is tied to the controller device via devres, allowing the data to
>> remain readable after Sahara channel teardown and ensuring automatic
>> cleanup when controller device is removed.
>>
> If this training data is RO, then what is the use of exposing it to userspace?
>
> - Mani
The sysfs attribute is read-only because its purpose is to export the 
training data captured by the driver to userspace. Userspace reads and 
persists it as a serial number specific firmware file. During next boot, 
the Sahara driver loads that file through the firmware framework and 
transfers it back to the device. The data is therefore not written back 
through sysfs, making the attribute writable is unnecessary and would 
allow arbitrary data injection.
>> Userspace flow:
>> 1. For each controller device, userspace reads the ddr_training_data sysfs
>>     attribute.
>> 2. If the read returns non-zero data, userspace persists it using a
>>     serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
>> 3. On subsequent boots, the Sahara driver attempts to load this serial
>>     specific DDR training image before falling back to the default
>>     training image, restoring DDR calibration data and avoiding retraining.
>>
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> Sahara MHI driver.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_cntrl_training_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_cntrl_training_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +static BIN_ATTR_RO(ddr_training_data, 0);
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
>> +
>> +	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return ret;
>>   	}
>>   
>> +	sahara_sysfs_create(mhi_dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
